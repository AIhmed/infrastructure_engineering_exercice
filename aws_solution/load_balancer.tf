resource "aws_elb" "web_app_lb" {
  name     = "web-app-load-balancer"
  internal = false
  subnets  = [module.networking.public_subnet_id]

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
    target              = "HTTP:80/"
  }

  instances = [aws_instance.web_app_vms[0].id, aws_instance.web_app_vms[1].id]

  tags = {
    Name = "web app elastic load balancers"
  }

}
