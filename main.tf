#https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs
terraform {
  required_version = ">1.0.0"
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  #https://cloud.digitalocean.com/account/api/tokens
  token = var.do_token
 
}

# iniciando a declaracao da infraestrutura

resource "digitalocean_kubernetes_cluster" "foo" {
  name   = var.k8s_name 
  #"foo"
  region = var.region
  #"nyc1"
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.22.8-do.1"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = 3    
  }
	
}

variable "do_token" {}
variable "k8s_name" {}
variable "region" {}

#output "kube_endpoint" {
#	value = digitalocean_kubernetes_cluster.foo.endpoint
#}

resource "local_file" "kube_config" {
    content  = digitalocean_kubernetes_cluster.foo.kube_config.0.raw_config 
    filename = "kube_config.yaml" # nome que ficheiro que ira gravar
}

