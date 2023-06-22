# # create application load balancer
# resource "aws_lb" "application_load_balancer" {
#   name               = "${var.vpc_name}-alb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = []
#   subnets            = []
#   enable_deletion_protection = 

#   tags   = {
#     Name = "${}-alb"
#   }
# }
