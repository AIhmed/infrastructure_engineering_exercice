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

module "network" {
  source  = "./modules/networking"
  vm1_url = google_compute_instance.web_app_vms["vm1"].self_link
  vm2_url = google_compute_instance.web_app_vms["vm2"].self_link
}
