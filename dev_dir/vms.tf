data "aws_ami" "vimage" { # initialising the amazon virtual machine images
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "web_app_vms" {
  instance_type   = "t2.micro"
  count           = 2
  ami             = data.aws_ami.vimage.id
  security_groups = [aws_security_group.allow_http.id]
  subnet_id       = aws_subnet.priv_subnet.id
  tags = {
    Name = "amazon vms"
  }
}
