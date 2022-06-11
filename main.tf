#https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }

}

# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
# variable "do_token" {"dop_v1_848c10424097e911e845f0583ae82b649a579dee8f5efc550b308b795f99e51e"} #Error: Argument or block definition required
# │
# │ On main.tf line 14: An argument or block definition is required here.

# Configure the DigitalOcean Provider

# ╷
# │ Error: Invalid single-argument block definition
# │
# │ On main.tf line 15: An argument definition on the same line as its containing block creates a single-line block definition, which must also be closed on the same line.
# │ Place the block's closing brace immediately after the argument definition.
provider "digitalocean" {
  token = "dop_v1_848c10424097e911e845f0583ae82b649a579dee8f5efc550b308b795f99e51e" 

}

# iniciando a declaracao da infraestrutura

# Create a web serve_iniciativa
# resource "digitalocean_droplet" "k8s_iniciativa" 
# ...https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/kubernetes_cluster

# resource "digitalocean_kubernetes_cluster" "k8siniciativa" {
#  name   = " k8s-iniciativa"
#  region = "nyc1"
  # Grab the latest version slug from `doctl kubernetes options versions`
#  version = "1.22.8-do.1"

#  node_pool {
#    name       = "default"
#    size       = "s-2vcpu-2gb"
#    node_count = 3
#  } # node_pool
  # 
#} # k8s_iniciativa

resource "digitalocean_kubernetes_cluster" "foo" {
  name   = "foo"
  region = "nyc1"
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.22.8-do.1"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = 3

    
  }
}
