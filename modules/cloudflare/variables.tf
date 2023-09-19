variable "cloudflare_domain" {
  description = "The domain for Cloudflare to manage"
  type        = string
}

variable "cloudflare_subdomains" {
  description = "List of subdomains to create CNAME records for"
  type        = list(string)
}

variable "cloudflare_a_record_name" {
  description = "Name for the A record pointing to the floating IP"
  type        = string
  default     = "swarm"
}

variable "floating_ip" {
  description = "Floating IP to be used in A record"
  type        = string
}

variable "cloudflare_zone_id" {
  description = "ID da Zona para o domínio na Cloudflare"
  type        = string
}