output "public_alb_security_group_id" {
  value = aws_security_group.public_alb_security_group.id
}

output "bastion_security_group_id" {
  value = aws_security_group.bastion_security_group.id
}

output "nginx_security_group_id" {
  value = aws_security_group.nginx_security_group.id
}

output "internal_alb_security_group_id" {
  value = aws_security_group.internal_alb_security_group.id
}

output "app_security_group_id" {
  value = aws_security_group.app_security_group.id
}