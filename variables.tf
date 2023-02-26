variable "aws_access_key_id" {
  type = string
}

variable "aws_secret_key_id" {
  type = string
}

variable "gcp_project_id" {
  type = string
}

variable "azure_subscription_id" {
  type = string
}

variable "azure_resource_group" {
  type = string
}

variable "azure_location" {
  type = string
  default = "Central US"
}
