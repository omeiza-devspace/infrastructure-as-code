# create security group for the application load balancer
resource "aws_security_group" "public_alb_security_group" {
  name        = "public alb sec grp"
  description = "enable http/https access on port 80/443 to public alb"
  vpc_id      = var.vpc_id

  ingress {
    description = "http access from the internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "https access from the internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "access to the internet"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.vpc_name}-http-http-access-to-alb"
  }
}

# create security group for the bastion host aka jump box
resource "aws_security_group" "bastion_security_group" {
  name        = "bastion sec grp"
  description = "enable ssh access on port 22 to bastion from devops engineers"
  vpc_id      = var.vpc_id

  ingress {
    description = "ssh access to bastion"
    from_port   = 22
    to_port     = 22
    protocol    = "ssh"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "access to the internet"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.vpc_name}-ssh-access-to-bastion"
  }
}

# create security group for the nginx proxy server
resource "aws_security_group" "nginx_security_group" {
  name        = "nginx sec grp"
  description = "enable ssh access on port 22 to nginx via bastion-sg and http,https via public-alb-sg"
  vpc_id      = var.vpc_id

  ingress {
    description     = "ssh access from bastion"
    from_port       = 22
    to_port         = 22
    protocol        = "ssh"
    security_groups = [aws_security_group.bastion_security_group.id]
  }

  ingress {
    description     = "http access from public-alb"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.public_alb_security_group.id]
  }

  ingress {
    description     = "https access from public-alb"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.public_alb_security_group.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.vpc_name}-ssh-via-bastion-and-http-https-via-alb"
  }
}

# create security group for the internal alb
resource "aws_security_group" "internal_alb_security_group" {
  name        = "internal alp sec grp"
  description = "enable http access on port 80 via nginx-sg"
  vpc_id      = var.vpc_id

  ingress {
    description     = "http access fron nginx"
    from_port       = 80
    to_port         = 80
    protocol        = "http"
    security_groups = [aws_security_group.nginx_security_group.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.vpc_name}-http-from-nginx-to-internal-alb"
  }
}

# create security group for the application
resource "aws_security_group" "app_security_group" {
  name        = "internal alb sec grp"
  description = "enable ssh access on port 22 via bastion-sg"
  vpc_id      = var.vpc_id

  ingress {
    description     = "ssh access via bastion"
    from_port       = 22
    to_port         = 22
    protocol        = "ssh"
    security_groups = [aws_security_group.bastion_security_group.id]
  }

  ingress {
    description     = "http access via internal-alb"
    from_port       = 80
    to_port         = 80
    protocol        = "http"
    security_groups = [aws_security_group.internal_alb_security_group.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.vpc_name}-ssh-via-bastion-and-http-via-internal-alb-to-app"
  }
}


 