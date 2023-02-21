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
  region      = var.region
}
