########### Public ALB ################

# create application load balancer
resource "aws_lb" "public_net_load_balancer" {
  name                       = "${var.vpc_name}-public-net-alb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [var.public_alb_security_group_id]
  subnets                    = [var.public_subnet_az1_id, var.public_subnet_az2_id]
  enable_deletion_protection = false
  ip_address_type            = "ipv4"

  tags = {
    Name = "${var.vpc_name}-public-net-alb"
  }
}

# create a listener on port 80 with redirect action
resource "aws_lb_listener" "Public_alb_http_listener" {
  load_balancer_arn = aws_lb.public_net_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx_alb_target_group.arn
  }
}



########### Internal ALB ################

# create application load balancer
resource "aws_lb" "internal_app_load_balancer" {
  name               = "${var.vpc_name}-internal-app-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [var.internal_alb_security_group_id]

  #review with counts and loop option
  subnets = [
    var.private_proxy_subnet_az1_id,
    var.private_proxy_subnet_az2_id,
    var.private_compute_subnet_az1_id,
    var.private_compute_subnet_az2_id,
  ]
  enable_deletion_protection = false
  ip_address_type            = "ipv4"

  tags = {
    Name = "${var.vpc_name}-internal-app-alb"
  }
}

# create a listener on port 80 with redirect action
resource "aws_lb_listener" "internal_alb_http_listener" {
  load_balancer_arn = aws_lb.internal_app_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_alb_target_group.arn
  }
}