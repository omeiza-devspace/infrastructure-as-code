variable "region" {}
variable "vpc_name" {}
variable "vpc_cidr" {}
variable "az1_gateway_subnet_cidr" {}
variable "az1_proxy_subnet_cidr" {}
variable "az1_compute_subnet_cidr" {}
variable "az2_gateway_subnet_cidr" {}
variable "az2_proxy_subnet_cidr" {}
variable "az2_compute_subnet_cidr" {}

#  variable "vpc_id" {}
#  variable "public_alb_security_group_id" {}
# variable "internal_alb_security_group_id" {}

# variable "private_proxy_subnet_az1_id" {}
# variable "private_proxy_subnet_az2_id" {}
# variable "private_compute_subnet_az1_id" {}
# variable "private_compute_subnet_az2_id" {}
# variable "public_gateway_subnet_az1_id" {}
# variable "public_gateway_subnet_az2_id" {}

variable "nginx_max_instance_size" {}
variable "nginx_min_instance_size" {}
variable "nginx_desired_capacity" {}

variable "app_max_instance_size" {}
variable "app_min_instance_size" {}
variable "app_desired_capacity" {}

variable "bastion_max_instance_size" {}
variable "bastion_min_instance_size" {}
variable "bastion_desired_capacity" {}

variable "ssh_key_pair" {}