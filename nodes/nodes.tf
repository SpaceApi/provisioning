variable "hetzner_token" {
  type = "string"
}

variable "spaceapi_volume_id" {
  type = "string"
}

variable "spaceapi_ipv4_id" {
  type = "string"
}

variable "spaceapi_ipv6_id" {
  type = "string"
}

variable "ssh_key_ids" {
  type = "list"
}

variable "domain" {
  type = "string"
}

provider "hcloud" {
  token = "${var.hetzner_token}"
}

resource "hcloud_server" "node1" {
  name = "node1.${var.domain}"
  image = "debian-9"
  server_type = "cx11"
  location = "nbg1"
  ssh_keys = "${var.ssh_key_ids}"
}

resource "hcloud_volume_attachment" "main" {
  volume_id = "${var.spaceapi_volume_id}"
  server_id = "${hcloud_server.node1.id}"
}

resource "hcloud_floating_ip_assignment" "node1_v4" {
  floating_ip_id = "${var.spaceapi_ipv4_id}"
  server_id = "${hcloud_server.node1.id}"
}

resource "hcloud_floating_ip_assignment" "node1_v6" {
  floating_ip_id = "${var.spaceapi_ipv6_id}"
  server_id = "${hcloud_server.node1.id}"
}
