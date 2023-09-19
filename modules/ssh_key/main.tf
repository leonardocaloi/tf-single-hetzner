terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.28.0" 
    }
  }
}

resource "hcloud_ssh_key" "my_ssh_keys" {
  for_each   = toset(var.ssh_pub_path_list)
  name       = "${basename(each.value)}"
  public_key = file(each.value)
}