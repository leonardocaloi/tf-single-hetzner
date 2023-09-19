output "network_id" {
  description = "The ID of the created network"
  value       = hcloud_network.swarm_network.id
}

output "manager_subnet_ip_range" {
  description = "IP range of the manager subnet"
  value       = hcloud_network_subnet.manager_subnet.ip_range
}

output "worker_subnet_ip_range" {
  description = "IP range of the worker subnet"
  value       = hcloud_network_subnet.worker_subnet.ip_range
}

output "manager_subnet_id" {
  description = "ID of the manager subnet"
  value       = hcloud_network_subnet.manager_subnet.id
}

output "worker_subnet_id" {
  description = "ID of the worker subnet"
  value       = hcloud_network_subnet.worker_subnet.id
}