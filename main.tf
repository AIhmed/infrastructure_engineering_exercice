terraform {
  required_providers {
    aws = {
      source  = "Hashicorp/aws"
      version = "3.27"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.53.1"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_key_id
}

provider "google" {
  credentials = file("~/google_cloud_credentials.json")
  project     = var.gcp_project_id
  region      = "us-central1"
}



module "gcp_solution" {
  source = "./gcp_solution"
  project_id = var.gcp_project_id
}

module "aws_solution" {
  source = "./aws_solution"
}
