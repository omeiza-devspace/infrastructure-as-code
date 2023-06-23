output "keypair_id" {
  value = aws_key_pair.keypair.id
}

output "nginx_auto_scal_grp_id" {
  value = aws_autoscaling_group.nginx_auto_scal_grp.id
}

output "app_auto_scal_grp_id" {
  value = aws_autoscaling_group.app_auto_scal_grp.id
}

output "bastion_auto_scal_grp_id" {
  value = aws_autoscaling_group.bastion_auto_scal_grp.id
}

output "bastion_launch_template_id" {
  value = aws_launch_template.bastion_launch_template.id
}

output "nginx_launch_template_id" {
  value = aws_launch_template.nginx_launch_template.id
}

output "app_launch_template_id" {
  value = aws_launch_template.app_launch_template.id
}

