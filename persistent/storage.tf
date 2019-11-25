resource "hcloud_volume" "prod" {
  name = "prod"
  size = 50
  location = var.location
}

resource "hcloud_volume" "dev" {
  name = "dev"
  size = 10
  location = var.location
}

output "storage_dev" {
  value = hcloud_volume.dev.id
}

output "storage_prod" {
  value = hcloud_volume.prod.id
}
