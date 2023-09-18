resource "cloudflare_record" "main" {
  zone_id = var.cloudflare_zone_id
  name    = var.cloudflare_a_record_name
  value   = var.floating_ip
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "subdomains" {
  count   = length(var.cloudflare_subdomains)
  zone_id = var.cloudflare_zone_id
  name    = "${element(var.cloudflare_subdomains, count.index)}.${var.cloudflare_domain}"
  value   = var.cloudflare_a_record_name
  type    = "CNAME"
  proxied = true
}
