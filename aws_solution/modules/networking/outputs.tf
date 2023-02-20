output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}
output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}
output "vpc_id" {
  value = aws_vpc.web_app_vpc.id
}