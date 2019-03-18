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

output "ipv4 dev id" {
  value = "${hcloud_floating_ip.devv4.id}"
}
output "ipv4 dev ip" {
  value = "${hcloud_floating_ip.devv4.ip_address}"
}
output "ipv6 dev id" {
  value = "${hcloud_floating_ip.devv6.id}"
}
output "ipv6 dev ip" {
  value = "${hcloud_floating_ip.devv6.ip_network}"
}

output "ipv4 prod id" {
  value = "${hcloud_floating_ip.prodv4.id}"
}
output "ipv4 prod ip" {
  value = "${hcloud_floating_ip.prodv4.ip_address}"
}
output "ipv6 prod id" {
  value = "${hcloud_floating_ip.prodv6.id}"
}
output "ipv6 prod ip" {
  value = "${hcloud_floating_ip.prodv6.ip_network}"
}
