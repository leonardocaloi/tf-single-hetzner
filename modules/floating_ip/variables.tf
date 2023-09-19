variable "type" {
  description = "Type of the Floating IP. ipv4 or ipv6"
  type        = string
}

# variable "server_id" {
#   description = "Server to assign the Floating IP to."
#   type        = number
# }

variable "name" {
  description = "Name of the Floating IP."
  type        = string
}

variable "description" {
  description = "Description of the Floating IP."
  type        = string
  default     = null
}

variable "home_location" {
  description = "Name of home location (routing is optimized for that location). Optional if server_id argument is passed."
  type        = string
}