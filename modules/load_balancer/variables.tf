variable "hetzner_token" {
  description = "The API token for your Hetzner account."
  type        = string
  sensitive   = true
}

variable "load_balancer_name" {
  description = "The name to assign to the load balancer."
  type        = string
}

variable "load_balancer_type" {
  description = "The location to create the load balancer in."
  type        = string
}


variable "load_balancer_location" {
  description = "The location to create the load balancer in."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet the load balancer should be attached to."
  type        = string
}

variable "server_ids" {
  description = "The IDs of the servers to be attached to the load balancer."
  type        = list(string)
}

# variable "floating_ip_id" {
#   description = "The ID of the floating IP to assign to the load balancer."
#   type        = string
# }

# variable "server_id" {
#   description = "The ID of the load balancer server to which the floating IP should be assigned."
#   type        = string
# }
