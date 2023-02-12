resource "aws_security_group" "allow_http" {
  vpc_id = aws_vpc.test_vpc.id
  name   = "allow_http"
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
    Name = "allow incoming and outgoing http request"
  }
}
