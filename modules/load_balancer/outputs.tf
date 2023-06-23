output "nginx_alb_target_group_id" {
  value = aws_lb_target_group.nginx_alb_target_group.id
}

output "bastion_alb_target_group_id" {
  value = aws_lb_target_group.bastion_alb_target_group.id
}

output "app_alb_target_group_id" {
  value = aws_lb_target_group.app_alb_target_group.id
}

output "public_net_load_balancer_id" {
  value = aws_lb.public_net_load_balancer.id
}

output "internal_app_load_balancer_id" {
  value = aws_lb.internal_app_load_balancer.id
}