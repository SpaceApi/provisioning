resource "hcloud_volume" "prod" {
  name = "prod"
  size = 50
  location = "${var.location}"
}

resource "hcloud_volume" "dev" {
  name = "dev"
  size = 10
  location = "${var.location}"
}

output "storage dev" {
  value = "${hcloud_volume.dev.id}"
}

output "storage prod" {
  value = "${hcloud_volume.prod.id}"
}
