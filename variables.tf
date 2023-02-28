variable "aws_access_key" {
  type = string
}

variable "aws_secret_key" {
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
  type    = string
  default = "Central US"
}

variable "enable_aws" {
  type    = bool
  default = false
}

variable "enable_gcp" {
  type    = bool
  default = false
}

variable "enable_azure" {
  type    = bool
  default = false
}
