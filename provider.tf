# terraform {
#   required_providers {
#     hcloud = {
#       source  = "hetznercloud/hcloud"
#     }
#     cloudflare = {
#       source  = "cloudflare/cloudflare"
#       version = "~> 2.0"
#     }
#   }
# }

# # Configuração do provedor Cloudflare
# provider "cloudflare" {
#   email   = var.cloudflare_email
#   api_token = var.cloudflare_api_token
# }

# # Configuração do provedor Hetzner
# provider "hcloud" {
#   token = var.hetzner_token
# }
