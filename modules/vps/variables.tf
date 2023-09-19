variable "hetzner_token" {
  description = "The token for accessing Hetzner Cloud"
  type        = string
}

variable "manager_server_type" {
  description = "Type of the manager server"
  type        = string
  default     = "CPX11"
}

variable "worker_server_type" {
  description = "Type of the worker servers"
  type        = string
  default     = "CPX21"
}

variable "worker_count" {
  description = "Number of worker servers to create"
  type        = number
}

variable "image" {
  description = "The image to use for the servers"
  type        = string
  default     = "debian-12"
}

variable "location" {
  description = "The location for the servers"
  type        = string
  default     = "Asburn, VA"
}

variable "ssh_keys" {
  description = "List of SSH keys to inject into the server"
  type        = list(string)
  default     = []
}

variable "manager_firewall_id" {
  description = "The ID of the network to attach to the server"
  type        = string
}

variable "worker_firewall_id" {
  description = "The ID of the network to attach to the server"
  type        = string
}

variable "network_id" {
  description = "Network ID to attach the VPS to"
  type        = string
}

variable "floating_ip_id" {
  description = "IP address of the created floating IP"
  type        = string
}

