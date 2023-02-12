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

  security_groups = [ aws_security_group.allow_http ]

  health_check {
    healthy_threshold = 5
    unhealthy_threshold = 2
    timeout = 10
    target = "HTTP:80/"
    interval = 15
  }

  instances = [aws_instances.web_app_vms.*.id]
  
  tags =  {
    Name = "elastic (classic) load balancer"
  }

}
