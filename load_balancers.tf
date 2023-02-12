/*
resource "aws_lb" "pr_alb" {
  name               = "private-subnet-load-balancer"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http.id, aws_security_group.allow_https.id]
  subnets            = [aws_subnet.test_private_subnet1.id, aws_subnet.test_private_subnet2.id]
  tags = {
    Name = "web app load balancer"
  }
}
*/

/*
resource "aws_elb" "web_app_elb" { # create an elastic internet-facing load balancer insider our public subnet
  name = "web-app-elb"
  internal = false 
  subnets = [aws_subnet.public_subnet.id]

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  security_groups = [ aws_security_group.allow_http.id ]

  health_check {
    healthy_threshold = 5
    unhealthy_threshold = 2
    timeout = 10
    target = "HTTP:80/"
    interval = 15
  }

  instances = [aws_instance.web_app_vms.*.id]
  
  tags =  {
    Name = "elastic (classic) load balancer"
  }

}
*/


resource "aws_elb" "web_app_elb" {
  name     = "web-app-elb"
  internal = false
  subnets  = [aws_subnet.public_subnet.id]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  security_groups = [aws_security_group.allow_http.id]
  health_check {
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 10
    interval            = 15
    target              = "http:80/"
  }
  instance = [aws_instance.web_app_vms.*.id]
  tags = {
    Name = "elastic load balancer"
  }
}
