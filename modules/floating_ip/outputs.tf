output "floating_ip_id" {
  value       = hcloud_floating_ip.floating_ip.id
  description = "ID of the created floating IP."
}

output "floating_ip_ip" {
  value       = hcloud_floating_ip.floating_ip.ip_address
  description = "IP address of the created floating IP."
}

