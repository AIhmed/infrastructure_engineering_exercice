terraform {
  required_providers {
    aws = {
      source  = "Hashicorp/aws"
      version = "3.27"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key_id
  secret_key = var.secret_key_id
}

module "networking" {
  source = "./modules/networking"
  vm1_id = module.compute.vm1_id
  vm2_id = module.compute.vm2_id
}

module "compute" {
  source = "./modules/compute"
  private_subnet_id = module.networking.private_subnet_id
  allow_http_sg_id = module.networking.allow_http_sg_id
}
