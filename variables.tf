variable "region" {}
variable "vpc_name" {}
variable "vpc_cidr" {}
variable "az1_gateway_subnet_cidr" {}
variable "az1_proxy_subnet_cidr" {}
variable "az1_compute_subnet_cidr" {}
variable "az2_gateway_subnet_cidr" {}
variable "az2_proxy_subnet_cidr" {}
variable "az2_compute_subnet_cidr" {}


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

variable "s3_bucket_name" {}
variable "aws_profile_name" {}
variable "document_directory" {}
variable "dynamodb_table_name" {}
variable "enable_data_encryption" {}
variable "enable_data_version" {}


 