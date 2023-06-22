# # create a listener on port 80 with redirect action
# resource "aws_lb_listener" "alb_http_listener" {
#   load_balancer_arn = 
#   port              = 
#   protocol          = 

#   default_action {
#     type = "redirect"

#     redirect {
#       port        = 443
#       protocol    = "HTTPS"
#       status_code = "HTTP_301"
#     }
#   }
# }

# # create a listener on port 443 with forward action
# resource "aws_lb_listener" "alb_https_listener" {
#   load_balancer_arn  = 
#   port               = 
#   protocol           = 
#   ssl_policy         = "ELBSecurityPolicy-2016-08"
#   certificate_arn    = 

#   default_action {
#     type             = 
#     target_group_arn = 
#   }
# }