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
  # project     = "${env("GOOGLE_CLOUD_PROJECT_ID")}"
  region = "us-central1"
}

module "network" {
  source = "./modules/networking"
}
