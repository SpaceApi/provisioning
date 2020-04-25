variable "hetzner_token" {
  type = string
}

variable "njalla_token" {
  type = string
}

variable "spaceapi_volume_id" {
  type = string
}

variable "spaceapi_ipv4_id" {
  type = string
}

variable "spaceapi_ipv6_id" {
  type = string
}

variable "ssh_key_ids" {
  type = list(string)
}

variable "domain" {
  type = string
}

provider "hcloud" {
  token = var.hetzner_token
}

provider "njalla" {
  token = var.njalla_token
}

resource "hcloud_server" "node1" {
  name = "node1.${var.domain}"
  image = "debian-10"
  server_type = "cx11"
  location = "nbg1"
  ssh_keys = var.ssh_key_ids
}

resource "hcloud_volume_attachment" "main" {
  volume_id = var.spaceapi_volume_id
  server_id = hcloud_server.node1.id
}

/*
resource "hcloud_floating_ip_assignment" "node1_v4" {
  floating_ip_id = var.spaceapi_ipv4_id
  server_id = hcloud_server.node1.id
}

resource "hcloud_floating_ip_assignment" "node1_v6" {
  floating_ip_id = var.spaceapi_ipv6_id
  server_id = hcloud_server.node1.id
}
*/
resource "njalla_domain_record" "node1_v4" {
  domain = var.domain
  name = "node1"
  content = hcloud_server.node1.ipv4_address
  ttl = 60
}

resource "njalla_domain_record" "node1_v6" {
  domain = var.domain
  name = "node1"
  content = hcloud_server.node1.ipv6_address
  type = "AAAA"
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
