terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

resource "cloudflare_record" "main" {
  zone_id = var.cloudflare_zone_id
  name    = var.cloudflare_a_record_name
  value   = var.floating_ip
  type    = "A"
  ttl     = 3600
  proxied = false
}

resource "cloudflare_record" "subdomains" {
  count   = length(var.cloudflare_subdomains)
  zone_id = var.cloudflare_zone_id
  name    = "${element(var.cloudflare_subdomains, count.index)}.${var.cloudflare_domain}"
  value   = "${var.cloudflare_a_record_name}.${var.cloudflare_domain}"
  type    = "CNAME"
  proxied = false
}
