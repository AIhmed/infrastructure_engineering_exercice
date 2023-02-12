terraform {
  required_providers {
    aws = {
      source  = "Hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
