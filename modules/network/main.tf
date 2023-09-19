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

resource "hcloud_network" "swarm_network" {
  name     = var.network_name
  ip_range = var.network_ip_range
}

resource "hcloud_network_subnet" "manager_subnet" {
  network_id   = hcloud_network.swarm_network.id
  type         = "cloud"
  network_zone = var.network_zone
  ip_range     = var.manager_subnet_range
}

resource "hcloud_network_subnet" "worker_subnet" {
  network_id   = hcloud_network.swarm_network.id
  type         = "cloud"
  network_zone = var.network_zone
  ip_range     = var.worker_subnet_range
}