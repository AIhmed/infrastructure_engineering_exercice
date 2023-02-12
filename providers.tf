terraform {
  required_providers {
    aws = {
      source  = "Hashicorp/aws"
      version = "~>4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
