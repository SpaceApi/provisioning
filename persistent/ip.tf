resource "hcloud_floating_ip" "prodv4" {
  type = "ipv4"
  home_location = "${var.location}"
}
resource "hcloud_floating_ip" "prodv6" {
  type = "ipv6"
  home_location = "${var.location}"
}

resource "hcloud_floating_ip" "devv4" {
  type = "ipv4"
  home_location = "${var.location}"
}
resource "hcloud_floating_ip" "devv6" {
  type = "ipv6"
  home_location = "${var.location}"
}

output "ip_legacy_dev_id" {
  value = "${hcloud_floating_ip.devv4.id}"
}
output "ip_legacy_dev_ip" {
  value = "${hcloud_floating_ip.devv4.ip_address}"
}
output "ip_dev_id" {
  value = "${hcloud_floating_ip.devv6.id}"
}
output "ip_dev_ip" {
  value = "${hcloud_floating_ip.devv6.ip_network}"
}

output "ip_legacy_prod_id" {
  value = "${hcloud_floating_ip.prodv4.id}"
}
output "ip_legacy_prod_ip" {
  value = "${hcloud_floating_ip.prodv4.ip_address}"
}
output "ip_prod_id" {
  value = "${hcloud_floating_ip.prodv6.id}"
}
output "ip_prod_ip" {
  value = "${hcloud_floating_ip.prodv6.ip_network}"
}
