output "aws_lb_dns_name" {
  value = var.enable_aws ? module.aws_solution[0].web_app_elb_dns_name : ""
}

output "gcp_lb_ip_address" {
  value = var.enable_gcp ? module.gcp_solution[0].http_lb_ip : ""
}

output "azure_lb_public_ip" {
  value = var.enable_azure ? module.azure_solution[0].dns_ip : ""
}
