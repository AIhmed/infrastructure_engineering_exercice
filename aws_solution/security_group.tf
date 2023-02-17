resource "aws_security_group" "allow_http" {
  vpc_id = module.networking.vpc_id
  name   = "allow-http"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow incoming and outgoing http requests to ec2 resources"
  }
}
