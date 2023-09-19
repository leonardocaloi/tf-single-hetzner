variable "hetzner_token" {
  description = "The token for accessing Hetzner Cloud"
  type        = string
}

variable "network_name" {
  description = "Name for the swarm network"
  type        = string
  default     = "swarm-network"
}

variable "network_ip_range" {
  description = "IP Range for the swarm network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "manager_subnet_range" {
  description = "IP range for the manager subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "worker_subnet_range" {
  description = "IP range for the worker subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "network_zone" {
  description = "Network zone for the subnet (location of your vps)"
  type        = string
  default     = "us-east"
}

