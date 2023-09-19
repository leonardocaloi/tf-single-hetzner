variable "hetzner_token" {
  description = "The token for accessing Hetzner Cloud"
  type        = string
}

variable "global_ssh_allowed_ips" {
  description = "Global list of CIDRs that are allowed to access SSH port."
  type        = list(string)
}

variable "manager_subnet_ip_range" {
  description = "IP range for the manager subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "worker_subnet_ip_range" {
  description = "IP range for the worker subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "http_https_allowed_ips" {
  description = "List of CIDRs that are allowed to access HTTP and HTTPS ports."
  type        = list(string)
  default     = ["0.0.0.0/0", "::/0"] # Default to allow HTTP and HTTPS from any IP
}

variable "swarm_specific_tcp_allowed_ips" {
  description = "List of CIDRs that are allowed to access specific Swarm TCP ports."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"] # Default to allow from manager and worker subnets
}

variable "swarm_specific_udp_allowed_ips" {
  description = "List of CIDRs that are allowed to access specific Swarm UDP ports."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"] # Default to allow from manager and worker subnets
}
