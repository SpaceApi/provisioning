variable "hetzner_token" {
  type = string
}

variable "location" {
  type = string
  default = "nbg1"
}

provider "hcloud" {
  token = var.hetzner_token
}
