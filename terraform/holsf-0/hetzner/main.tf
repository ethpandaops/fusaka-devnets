////////////////////////////////////////////////////////////////////////////////////////
//                            TERRAFORM PROVIDERS & BACKEND
////////////////////////////////////////////////////////////////////////////////////////
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.28"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.42.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

terraform {
  backend "s3" {
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    endpoints                   = { s3 = "https://fra1.digitaloceanspaces.com" }
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    region                      = "us-east-1"
    bucket                      = "merge-testnets"
    key                         = "infrastructure/fusaka-holsf-0/hetzner-terraform.tfstate"
  }
}

provider "digitalocean" {
  http_retry_max = 20
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

////////////////////////////////////////////////////////////////////////////////////////
//                                        VARIABLES
////////////////////////////////////////////////////////////////////////////////////////
variable "cloudflare_api_token" {
  type        = string
  sensitive   = true
  description = "Cloudflare API Token"
}

variable "ethereum_network" {
  type    = string
  default = "fusaka-holsf-0"
}

variable "base_cidr_block" {
  default = "10.210.0.0/16"
}
////////////////////////////////////////////////////////////////////////////////////////
//                                        LOCALS
////////////////////////////////////////////////////////////////////////////////////////
locals {
  vm_groups = [
    var.bootnode,
    var.mev_relay,
    # Fullnodes
    var.lighthouse_geth,
    var.lighthouse_nethermind,
    var.lighthouse_besu,
    var.lighthouse_erigon,
    var.lighthouse_reth,
    var.prysm_geth,
    var.prysm_nethermind,
    var.prysm_besu,
    var.prysm_erigon,
    var.prysm_reth,
    var.teku_geth,
    var.teku_nethermind,
    var.teku_besu,
    var.teku_reth,
    var.nimbus_geth,
    var.nimbus_nethermind,
    var.nimbus_besu,
    var.lodestar_geth,
    var.lodestar_nethermind,
    var.lodestar_besu,
    var.lodestar_reth,
    var.grandine_geth,
    var.grandine_nethermind,
    var.grandine_reth,
  ]
}
