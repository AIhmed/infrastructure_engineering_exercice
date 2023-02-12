data "aws_ami" "web_app_vm_ami" {
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

resource "aws_instance" "web_app_vm" {
  instance_type = "t2.micro"
  ami           = data.aws_ami.web_app_vm_ami.id
  user_data     = file("apache2_server.sh")
  tags = {
    Name = "ubuntu vms"
  }
}
