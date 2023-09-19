output "manager_firewall_id" {
  description = "The ID of the manager firewall"
  value       = hcloud_firewall.manager_firewall.id
}

output "worker_firewall_id" {
  description = "The ID of the worker firewall"
  value       = hcloud_firewall.worker_firewall.id
}
