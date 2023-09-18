output "master_firewall_id" {
  description = "The ID of the master firewall"
  value       = hcloud_firewall.master_firewall.id
}

output "worker_firewall_id" {
  description = "The ID of the worker firewall"
  value       = hcloud_firewall.worker_firewall.id
}
