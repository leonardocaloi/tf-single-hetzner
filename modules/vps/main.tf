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


resource "hcloud_server" "master_vps" {
  name        = "master"
  server_type = var.master_server_type
  image       = var.image
  location    = var.location
  ssh_keys    = var.ssh_keys
  labels      = { "node" : "master" }
  firewall_ids = [ var.master_firewall_id ]
  network {
    ip   = "10.0.1.1"
    network_id = var.network_id
  }
}

resource "hcloud_server_network" "master_vps_network" {
  server_id  = hcloud_server.master_vps.id
  network_id = var.network_id
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


resource "hcloud_server_network" "worker_vps_network" {
  count = var.worker_count
  server_id  = hcloud_server.worker_vps[count.index].id
  network_id = var.network_id
}
