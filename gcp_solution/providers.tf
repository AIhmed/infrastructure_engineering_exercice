terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.53.1"
    }
  }
}

provider "google" {
  credentials = file("~/google_cloud_credentials.json")
  project     = var.project_id
  region      = "us-central1"
}

module "compute" {
  source                   = "./modules/compute"
  terr_private_subnet_name = module.network.terr_private_subnet_name
  terr_vpc_name            = module.network.terr_vpc_name
}

module "network" {
  source            = "./modules/networking"
  terr_vms_group_id = module.compute.terr_vms_group_id
  project_id = var.project_id

  #vm1_url = module.compute.terr_vm1_link
  #vm2_url = module.compute.terr_vm2_link
}
module "monitoring" {
  source = "./modules/monitoring"
  lb_name = module.network.lb_name
}
