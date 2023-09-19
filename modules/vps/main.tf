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

data "hcloud_floating_ip" "floating_ip" {
  id = var.floating_ip_id
}

resource "hcloud_server" "manager_vps" {
  name         = "manager"
  server_type  = var.manager_server_type
  image        = var.image
  location     = var.location
  ssh_keys     = var.ssh_keys
  labels       = { "node" : "manager" }
  firewall_ids = [ var.manager_firewall_id ]
  user_data = <<-EOT
    #cloud-config
    runcmd:
      - "sudo ip addr add ${data.hcloud_floating_ip.floating_ip.ip_address} dev eth0"
  EOT
  network {
    ip   = "10.0.1.1"
    network_id = var.network_id
  }
}

resource "hcloud_server" "worker_vps" {
  count = var.worker_count
  name        = "worker-${count.index+1}"
  server_type = var.worker_server_type
  image       = var.image
  location    = var.location
  ssh_keys    = var.ssh_keys
  labels      = { "node" : "worker" }
  firewall_ids = [ var.worker_firewall_id ]
  network {
    ip   = "10.0.2.${count.index+1}"
    network_id = var.network_id
  }
}

resource "hcloud_server_network" "manager_vps_network" {
  server_id  = hcloud_server.manager_vps.id
  network_id = var.network_id
}

resource "hcloud_floating_ip_assignment" "floating_ip_assignment" {
  floating_ip_id = var.floating_ip_id
  server_id      = hcloud_server.manager_vps.id
}
