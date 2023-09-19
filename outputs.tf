output "floating_ip_details" {
  value = {
    floating_ip_ip = module.floating_ip.floating_ip_ip
  }
  description = "Detalhes do IP flutuante"
}
