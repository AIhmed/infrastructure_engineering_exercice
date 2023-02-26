output "aws_lb_dns_name" {
value = module.aws_solution.web_app_elb_dns_name
}

output "gcp_lb_ip_address" {
value = module.gcp_solution.http_lb_ip
}
