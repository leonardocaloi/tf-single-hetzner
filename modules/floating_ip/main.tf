terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

resource "hcloud_floating_ip" "floating_ip" {
  # server_id = var.server_id
  type      = var.type
  name      = var.name
  home_location = var.home_location
  description = var.description
}
