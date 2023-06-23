resource "aws_autoscaling_group" "nginx_auto_scal_grp" {
  name                      = "${var.vpc_name}-nginx-asg"
  max_size                  = var.nginx_max_instance_size
  min_size                  = var.nginx_min_instance_size
  desired_capacity          = var.nginx_desired_capacity
  health_check_grace_period = 300
  health_check_type         = "ELB"

  vpc_zone_identifier = [
    var.private_proxy_subnet_az1_id,
    var.private_proxy_subnet_az2_id
  ]

  launch_template {
    id      = aws_launch_template.nginx_launch_template.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = "${var.vpc_name}-nginx-asg"
    propagate_at_launch = true
  }

}

resource "aws_autoscaling_group" "app_auto_scal_grp" {
  name                      = "${var.vpc_name}-app-asg"
  max_size                  = var.app_max_instance_size
  min_size                  = var.app_min_instance_size
  desired_capacity          = var.app_desired_capacity
  health_check_grace_period = 300
  health_check_type         = "ELB"

  vpc_zone_identifier = [
    var.private_compute_subnet_az1_id,
    var.private_compute_subnet_az2_id
  ]


  launch_template {
    id      = aws_launch_template.app_launch_template.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = "${var.vpc_name}-app-asg"
    propagate_at_launch = true
  }

}

resource "aws_autoscaling_group" "bastion_auto_scal_grp" {
  name                      = "${var.vpc_name}-bastion-asg"
  max_size                  = var.bastion_max_instance_size
  min_size                  = var.bastion_min_instance_size
  desired_capacity          = var.bastion_desired_capacity
  health_check_grace_period = 300
  health_check_type         = "ELB"

  vpc_zone_identifier = [
    var.public_gateway_subnet_az1_id,
    var.public_gateway_subnet_az2_id
  ]


  launch_template {
    id      = aws_launch_template.bastion_launch_template.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = "${var.vpc_name}-bastion-asg"
    propagate_at_launch = true
  }

}
