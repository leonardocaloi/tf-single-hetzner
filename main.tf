terraform {
  cloud {
    organization = "Ventros"

    workspaces {
      name = "hetzner-k8s-tf"
    }
  }
}

provider "hcloud" {
  token = var.hetzner_token
}

provider "cloudflare" {
  email   = var.cloudflare_email
  api_token = var.cloudflare_api_token
}

terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.28.0" 
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 2.0" 
    }
  }
}

module "network" {
  source  = "./modules/network"
  hetzner_token = var.hetzner_token
  network_name = var.network_name
  network_ip_range    = var.network_ip_range
  master_subnet_range  = var.master_subnet_range
  worker_subnet_range  = var.worker_subnet_range
  network_zone  =  var.network_zone
}

module "firewall" {
  source = "./modules/firewall"

  hetzner_token         = var.hetzner_token
  # k8s_master_ports      = var.k8s_master_ports
  # k8s_worker_ports      = var.k8s_worker_ports
  # ssh_allowed_ips       = var.ssh_allowed_ips
  master_subnet_ip_range = module.network.master_subnet_ip_range
  worker_subnet_ip_range = module.network.worker_subnet_ip_range
}

module "vps" {
  source = "./modules/vps"

  hetzner_token       = var.hetzner_token
  master_server_type  = var.master_server_type
  worker_server_type  = var.worker_server_type
  worker_count        = var.worker_count
  image               = var.image
  location            = var.location
  ssh_keys            = var.ssh_pub_path_list
  network_id          = module.network.network_id
  master_firewall_id  = module.firewall.master_firewall_id
  worker_firewall_id  = module.firewall.worker_firewall_id
}

module "load_balancer" {
  source = "./modules/load_balancer" # caminho para o diretório do módulo

  hetzner_token           = var.hetzner_token
  load_balancer_type      = var.load_balancer_type
  load_balancer_name      = var.load_balancer_name
  load_balancer_location  = var.load_balancer_location
  subnet_id               = module.network.worker_subnet_id  # assumindo que você tem um módulo para a rede
  server_ids              = module.vps.server_ids  # assumindo que você tem um módulo para os servidores
}

# module "cloudflare" {
#   source   = "./modules/cloudflare"
#   email    = var.cloudflare_email
#   token    = var.cloudflare_api_token
#   zone_id  = var.cloudflare_zone_id
#   domain   = var.domain
#   subdomains = var.subdomains
#   a_record_name = var.a_record_name
#   floating_ip   = 
#   depends_on = []
# }
