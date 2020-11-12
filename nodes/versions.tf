terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
    }
    njalla = {
      source = "gidsi/njalla"
      version = "1.0.0"
    }
  }
  required_version = ">= 0.13"
}
