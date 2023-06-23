# create nginx target group
resource "aws_lb_target_group" "nginx_alb_target_group" {
  name        = "${var.vpc_name}-nginx-alb-tgt-grp"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id

  health_check {
    healthy_threshold   = 5
    interval            = 30
    path                = "/healthstatus"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }
}

# create bastion target group
resource "aws_lb_target_group" "bastion_alb_target_group" {
  name        = "${var.vpc_name}-bastion-alb-tgt-grp"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id

  health_check {
    healthy_threshold   = 5
    interval            = 30
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }
}

# create target app group
resource "aws_lb_target_group" "app_alb_target_group" {
  name        = "${var.vpc_name}-app-alb-tgt-grp"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id

  health_check {
    healthy_threshold   = 5
    interval            = 30
    path                = "/healthstatus"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }
}