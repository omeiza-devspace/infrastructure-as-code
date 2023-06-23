locals {
  device_name       = "/dev/sda1"
  ebs_volume_size   = 10
  shutdown_behavior = "terminate"
  instance_type     = "t2.micro"
  key_name          = "devops"
  resource_type     = "instance"
  ssh_key_pair      = aws_key_pair.keypair.id
}

#  launch template for bastion
resource "aws_launch_template" "bastion_launch_template" {
  name = "${var.vpc_name}-bastion-launch-template"

  block_device_mappings {
    device_name = local.device_name

    ebs {
      volume_size = local.ebs_volume_size
    }
  }

  image_id = "ami-0b0af3577fe5e3532"

  instance_initiated_shutdown_behavior = local.shutdown_behavior

  instance_type = local.instance_type

  key_name = local.ssh_key_pair

  monitoring {
    enabled = true
  }

  #   placement {
  #     availability_zone = "us-east-1a"
  #   }

  vpc_security_group_ids = [var.bastion_security_group_id]

  tag_specifications {
    resource_type = local.resource_type

    tags = {
      Name = "${var.vpc_name}-bastion-launch-template"
    }
  }

  user_data = filebase64("${path.module}/user_data/bastion_data.tpl")
}

# launch template for nginx
resource "aws_launch_template" "nginx_launch_template" {
  name = "${var.vpc_name}-nginx-launch-template"

  block_device_mappings {
    device_name = local.device_name

    ebs {
      volume_size = local.ebs_volume_size
    }
  }

  image_id = "ami-0b0af3577fe5e3532"

  instance_initiated_shutdown_behavior = local.shutdown_behavior

  instance_type = local.instance_type

  key_name = local.ssh_key_pair

  monitoring {
    enabled = true
  }

  # placement {
  #     availability_zone = "us-east-1a"
  # }

  vpc_security_group_ids = [var.nginx_security_group_id]

  tag_specifications {
    resource_type = local.resource_type

    tags = {
      Name = "${var.vpc_name}-nginx-launch-template"
    }
  }

  user_data = filebase64("${path.module}/user_data/nginx_data.tpl")
}

# launch template for wordpress
resource "aws_launch_template" "app_launch_template" {
  name = "${var.vpc_name}-app-launch-template"

  block_device_mappings {
    device_name = local.device_name

    ebs {
      volume_size = local.ebs_volume_size
    }
  }

  image_id = "ami-0b0af3577fe5e3532"

  instance_initiated_shutdown_behavior = local.shutdown_behavior

  instance_type = local.instance_type

  key_name = local.ssh_key_pair

  monitoring {
    enabled = true
  }

  # placement {
  #     availability_zone = "us-east-1a"
  # }

  vpc_security_group_ids = [var.app_security_group_id]

  tag_specifications {
    resource_type = local.resource_type
    tags          = { Name = "${var.vpc_name}-app-launch-template" }
  }

  user_data = filebase64("${path.module}/user_data/app_data.tpl")
}

