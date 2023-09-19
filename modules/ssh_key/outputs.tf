output "ssh_key_names" {
  value       = [for key in hcloud_ssh_key.my_ssh_keys : key.name]
  description = "Nomes das chaves SSH criadas"
}