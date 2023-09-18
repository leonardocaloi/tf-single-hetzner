output "network_id" {
  description = "The ID of the created network"
  value       = hcloud_network.k8s_network.id
}

output "master_subnet_ip_range" {
  description = "IP range of the master subnet"
  value       = hcloud_network_subnet.master_subnet.ip_range
}

output "master_subnet_id" {
  description = "ID of the master subnet"
  value       = hcloud_network_subnet.master_subnet.id
}

output "worker_subnet_id" {
  description = "ID of the worker subnet"
  value       = hcloud_network_subnet.worker_subnet.id
}

output "worker_subnet_ip_range" {
  description = "IP range of the worker subnet"
  value       = hcloud_network_subnet.worker_subnet.ip_range
}
