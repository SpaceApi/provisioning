variable "hetzner_token" {
  type = string
}

variable "njalla_token" {
  type = string
}

variable "spaceapi_volume_id" {
  type = string
}

variable "ssh_key_ids" {
  type = list(string)
}

variable "domain" {
  type = string
}

variable "env" {
  type = string
}

provider "hcloud" {
  token = var.hetzner_token
}

provider "njalla" {
  api_token = var.njalla_token
}

resource "hcloud_server" "node1" {
  name = "node1.${var.domain}"
  image = "debian-12"
  server_type = "cx22"
  location = "nbg1"
  ssh_keys = var.ssh_key_ids
}

resource "hcloud_volume_attachment" "main" {
  volume_id = var.spaceapi_volume_id
  server_id = hcloud_server.node1.id
}

resource njalla_record_a node1_v4 {
  domain = var.domain
  name = "node1"
  content = hcloud_server.node1.ipv4_address
  ttl = 60
}

resource njalla_record_aaaa node1_v6 {
  domain = var.domain
  name = "node1"
  content = hcloud_server.node1.ipv6_address
  ttl = 60
}

resource "hcloud_rdns" "node1_v4" {
  server_id = hcloud_server.node1.id
  ip_address = hcloud_server.node1.ipv4_address
  dns_ptr = "node1.${var.domain}"
}

resource "hcloud_rdns" "node1_v6" {
  server_id = hcloud_server.node1.id
  ip_address = hcloud_server.node1.ipv6_address
  dns_ptr = "node1.${var.domain}"
}

resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/templates/hosts.tpl",
    {
      node1_ipv4 = hcloud_server.node1.ipv4_address
      node1_ipv6 = hcloud_server.node1.ipv6_address
      domain = var.domain
    }
  )
  filename = "../deployment/inventory_${var.env}.yaml"
}
