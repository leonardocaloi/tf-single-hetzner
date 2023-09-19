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

resource "hcloud_firewall" "manager_firewall" {
  name = "manager-firewall"
  labels  = { "node" : "manager" }
  # Allow SSH access
  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "22"
    source_ips  = var.global_ssh_allowed_ips
  }

  # Permitir tráfego HTTPS
  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "443"
    source_ips  = var.http_https_allowed_ips
  }

  # Permitir tráfego HTTP
  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "80"
    source_ips  = var.http_https_allowed_ips
  }

  # Regras específicas do Swarm
  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "2377"
    source_ips  = var.global_ssh_allowed_ips
  }

  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "7946"
    source_ips  = [var.worker_subnet_ip_range, var.manager_subnet_ip_range]
  }

  rule {
    direction   = "in"
    protocol    = "udp"
    port        = "4789"
    source_ips  = [var.worker_subnet_ip_range, var.manager_subnet_ip_range]
  }

  rule {
    direction   = "in"
    protocol    = "udp"
    port        = "7946"
    source_ips  = [var.worker_subnet_ip_range, var.manager_subnet_ip_range]
  }
}

resource "hcloud_firewall" "worker_firewall" {
  name = "worker-firewall"
  labels  = { "node" : "worker" }

  # Allow SSH access
  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "22"
    source_ips  = var.global_ssh_allowed_ips
  }

  # Regras específicas do Swarm
  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "7946"
    source_ips  = [var.manager_subnet_ip_range]
  }

  rule {
    direction   = "in"
    protocol    = "udp"
    port        = "4789"
    source_ips  = [var.manager_subnet_ip_range]
  }

  rule {
    direction   = "in"
    protocol    = "udp"
    port        = "7946"
    source_ips  = [var.manager_subnet_ip_range]
  }
}
