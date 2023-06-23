variable "vpc_name" {}
variable "ssh_key_pair" {}

variable "private_proxy_subnet_az1_id" {}
variable "private_proxy_subnet_az2_id" {}
variable "private_compute_subnet_az1_id" {}
variable "private_compute_subnet_az2_id" {}
variable "public_gateway_subnet_az1_id" {}
variable "public_gateway_subnet_az2_id" {}

variable "nginx_max_instance_size" {}
variable "nginx_min_instance_size" {}
variable "nginx_desired_capacity" {}

variable "app_max_instance_size" {}
variable "app_min_instance_size" {}
variable "app_desired_capacity" {}

variable "bastion_max_instance_size" {}
variable "bastion_min_instance_size" {}
variable "bastion_desired_capacity" {}

variable "app_security_group_id" {}
variable "nginx_security_group_id" {}
variable "bastion_security_group_id" {}