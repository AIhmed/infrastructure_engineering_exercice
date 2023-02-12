data "aws_ami" "vimages" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
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
  ami             = data.aws_ami.vimages.id
  subnet_id       = module.networking.private_subnet_id
  security_groups = [aws_security_group.allow_http.id]
  instance_type   = "t2.micro"
  count           = 2
  user_data       = file("apache2_server.sh")
  tags = {
    Name = "web app ubuntu vms"
  }
}
