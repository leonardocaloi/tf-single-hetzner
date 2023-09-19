terraform {
  cloud {
    organization = "Ventros"

    workspaces {
      name = "hetzner-swarm-tf"
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
  manager_subnet_range  = var.manager_subnet_range
  worker_subnet_range  = var.worker_subnet_range
  network_zone  =  var.network_zone
}

module "firewall" {
  source = "./modules/firewall"
  hetzner_token         = var.hetzner_token
  global_ssh_allowed_ips = var.global_ssh_allowed_ips
  manager_subnet_ip_range = module.network.manager_subnet_ip_range
  worker_subnet_ip_range = module.network.worker_subnet_ip_range
}

module "floating_ip" {
  source = "./modules/floating_ip"
  name              = "floating_ip"
  type              = "ipv4"
  home_location = var.floating_ip_home_location
}

module "ssh_key" {
  source            = "./modules/ssh_key"
  ssh_pub_path_list = var.ssh_pub_path_list
}

module "vps" {
  source = "./modules/vps"

  hetzner_token       = var.hetzner_token
  manager_server_type = var.manager_server_type
  worker_server_type  = var.worker_server_type
  worker_count        = var.worker_count
  image               = var.image
  location            = var.location
  ssh_keys            = module.ssh_key.ssh_key_names
  network_id          = module.network.network_id
  manager_firewall_id = module.firewall.manager_firewall_id
  worker_firewall_id  = module.firewall.worker_firewall_id
  floating_ip_id      = module.floating_ip.floating_ip_id
}


module "cloudflare" {
  source = "./modules/cloudflare"
  
  cloudflare_zone_id        = var.cloudflare_zone_id
  cloudflare_a_record_name  = var.a_record_name
  cloudflare_subdomains     = var.subdomains
  cloudflare_domain         = var.domain
  floating_ip = module.floating_ip.floating_ip_ip
}

