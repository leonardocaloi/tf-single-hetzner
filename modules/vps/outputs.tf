output "server_ids" {
  value = hcloud_server.worker_vps[*].id
  description = "The IDs of the worker servers"
}

output "master_id" {
  description = "ID of the master server"
  value       = hcloud_server.master_vps.id
}
