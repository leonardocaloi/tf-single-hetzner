variable "cloudflare_email" {
  description = "E-mail usado para a conta Cloudflare"
  type        = string
}

variable "cloudflare_api_token" {
  description = "Token API para a conta Cloudflare"
  type        = string
}

variable "cloudflare_zone_id" {
  description = "ID da Zona para o domínio na Cloudflare"
  type        = string
}

variable "hetzner_token" {
  description = "Token de acesso à API da Hetzner"
  type        = string
}

variable "domain" {
  description = "Nome do domínio a ser configurado"
  type        = string
}

variable "subdomains" {
  description = "Subdomínios a serem configurados"
  type        = list(string)
}

variable "a_record_name" {
  description = "Nome para o registro A no DNS da Cloudflare"
  type        = string
}

variable "master_server_type" {
  description = "Tipo do servidor mestre na Hetzner"
  type        = string
}

variable "worker_server_type" {
  description = "Tipo do servidor worker na Hetzner"
  type        = string
}

variable "worker_count" {
  description = "Quantidade de servidores worker a serem criados"
  type        = number
}

variable "image" {
  description = "Imagem a ser usada para os servidores"
  type        = string
}

variable "location" {
  description = "Localização dos servidores"
  type        = string
}

variable "load_balancer_name" {
  description = "Nome para o Load Balancer"
  type        = string
}

variable "load_balancer_location" {
  description = "Localização do Load Balancer"
  type        = string
}

variable "floating_ip_type" {
  description = "Tipo do IP flutuante"
  type        = string
}

variable "floating_ip_home_location" {
  description = "Localização base do IP flutuante"
  type        = string
}

variable "ssh_pub_path_list" {
  description = "Caminho para a chave pública SSH"
  type        = list(string)
}

variable "network_name" {
  description = "The name of the network"
  type        = string
}

variable "network_ip_range" {
  description = "The IP range of the network"
  type        = string
}

variable "master_subnet_range" {
  description = "The IP range for the master subnet"
  type        = string
}

variable "worker_subnet_range" {
  description = "The IP range for the worker subnet"
  type        = string
}

variable "network_zone" {
  description = "The network zone"
  type        = string
}

variable "load_balancer_type" {
  description = "The network zone"
  type        = string
}

# variable "server_ids" {
#   description = "The network zone"
#   type        = string
# }
