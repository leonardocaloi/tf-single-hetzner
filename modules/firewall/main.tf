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


resource "hcloud_firewall" "master_firewall" {
  name = "master-firewall"

  # Allow SSH access
  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "22"
    source_ips  = var.ssh_allowed_ips
  }

  rule {
    direction   = "in"
    protocol    = "udp"
    port        = "8472" # VXLAN (ou 6081 para Geneve)
    source_ips  = [var.worker_subnet_ip_range, var.master_subnet_ip_range]
  }

   rule {
    direction   = "in"
    protocol    = "udp"
    port        = "4789" # VXLAN
    source_ips  = [var.worker_subnet_ip_range, var.master_subnet_ip_range]
  }

  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "4240" # Health check do Cilium
    source_ips  = [var.worker_subnet_ip_range, var.master_subnet_ip_range]
  }

  # Kubernetes master node ports
  dynamic "rule" {
    for_each = var.k8s_master_ports
    content {
      direction   = "in"
      protocol    = "tcp"
      port        = rule.value.port
      source_ips  = rule.value.source_ips
    }
  }
}

resource "hcloud_firewall" "worker_firewall" {
  name = "worker-firewall"

  # Allow SSH access
  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "22"
    source_ips  = var.ssh_allowed_ips
  }

  # Allow HTTP traffic to the worker nodes from the world
  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "80"
    source_ips  = ["0.0.0.0/0", "::/0"]
  }

  # Allow HTTPS traffic to the worker nodes from the world
  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "443"
    source_ips  = ["0.0.0.0/0", "::/0"]
  }

  rule {
    direction   = "in"
    protocol    = "udp"
    port        = "8472" # VXLAN (ou 6081 para Geneve)
    source_ips  = [var.master_subnet_ip_range]
  }

  rule {
    direction   = "in"
    protocol    = "udp"
    port        = "4789" # VXLAN
    source_ips  = [var.master_subnet_ip_range]
  }

  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "4240"
    source_ips  = [var.worker_subnet_ip_range, var.master_subnet_ip_range]
  }

  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "4244"
    source_ips  = [var.worker_subnet_ip_range, var.master_subnet_ip_range]
  }

  # Kubernetes worker node ports
  dynamic "rule" {
    for_each = var.k8s_worker_ports
    content {
      direction   = "in"
      protocol    = "tcp"
      port        = rule.value.port
      source_ips  = rule.value.source_ips
    }
  }
}
