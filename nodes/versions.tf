terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
    }
    njalla = {
      source  = "Sighery/njalla"
      version = "~> 0.10.0"
    }
  }
  required_version = ">= 0.13"
}
