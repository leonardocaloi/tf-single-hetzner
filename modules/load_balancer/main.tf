provider "hcloud" {
  token = var.hetzner_token
}

terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.28.0"
    }
  }
}

resource "hcloud_load_balancer" "main" {
  name     = var.load_balancer_name
  location = var.load_balancer_location
  load_balancer_type = var.load_balancer_type
  algorithm {
    type = "round_robin"
  }
}

# resource "hcloud_load_balancer_network" "main" {
#   load_balancer_id = hcloud_load_balancer.main.id
#   subnet_id        = var.subnet_id
# }

resource "hcloud_load_balancer_target" "main" {
  count            = length(var.server_ids)
  type             = "server"
  load_balancer_id = hcloud_load_balancer.main.id
  server_id        = var.server_ids[count.index]
}

