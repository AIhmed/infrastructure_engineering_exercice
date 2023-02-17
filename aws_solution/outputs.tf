output "ps_id" {
  value = module.networking.public_subnet_id
}
output "prs_id" {
  value = module.networking.private_subnet_id
}
output "web_app_elb_dns_name" {
value = aws_elb.web_app_lb.dns_name
}
