output "server_ids" {
  value = hcloud_server.worker_vps[*].id
  description = "The IDs of the worker servers"
}

output "manager_id" {
  description = "ID of the manager server"
  value       = hcloud_server.manager_vps.id
}
