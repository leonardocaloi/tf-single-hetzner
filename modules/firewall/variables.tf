variable "hetzner_token" {
  description = "The token for accessing Hetzner Cloud"
  type        = string
}

variable "ssh_allowed_ips" {
  description = "List of CIDRs that are allowed to access SSH port."
  type        = list(string)
  default     = ["0.0.0.0/0", "::/0"] # Default to allow SSH from any IP
}

variable "k8s_master_ports" {
  description = "List of port configurations that should be open on Kubernetes master nodes."
  type        = list(object({
    port       = string,
    source_ips = list(string)
  }))
  default     = [
    { port = "6443", source_ips = ["10.0.2.0/24", "10.0.1.0/24"] } # Kubernetes API server port
  ]
}

variable "k8s_worker_ports" {
  description = "List of port configurations that should be open on Kubernetes worker nodes."
  type        = list(object({
    port       = string,
    source_ips = list(string)
  }))
  default     = [
    { port = "10250-10252", source_ips = ["10.0.1.0/24", "10.0.2.0/24"] }, # Kubelet API
    { port = "30000-32767", source_ips = ["10.0.1.0/24", "10.0.2.0/24"] }  # Default NodePort range
  ]
}

variable "master_subnet_ip_range" {
  description = "IP range for the master subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "worker_subnet_ip_range" {
  description = "IP range for the worker subnet"
  type        = string
  default     = "10.0.2.0/24"
}
