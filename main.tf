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
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
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

provider "azurerm" {
  features {}
  subscription_id = var.azure_subscription_id
  skip_provider_registration = true
}


module "gcp_solution" {
  source = "./gcp_solution"
  project_id = var.gcp_project_id
}

module "aws_solution" {
  source = "./aws_solution"
}
module "azure_solution" {
  source = "./azure_solution"
  location = var.azure_location
  resource_group_name = var.azure_resource_group
}
