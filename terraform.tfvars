region                  = "eu-west-1"
vpc_name                = "mpc"
vpc_cidr                = "10.0.0.0/16"
az1_gateway_subnet_cidr = "10.0.1.0/24"
az1_proxy_subnet_cidr   = "10.0.2.0/24"
az1_compute_subnet_cidr = "10.0.3.0/24"
az2_gateway_subnet_cidr = "10.0.4.0/24"
az2_proxy_subnet_cidr   = "10.0.5.0/24"
az2_compute_subnet_cidr = "10.0.6.0/24"

nginx_max_instance_size = 0
nginx_min_instance_size = 0
nginx_desired_capacity  = 0

app_max_instance_size = 0
app_min_instance_size = 0
app_desired_capacity  = 0

bastion_max_instance_size = 0
bastion_min_instance_size = 0
bastion_desired_capacity  = 0

ssh_key_pair = "~/.ssh/terraform_ssh_key.pub"

s3_bucket_name         = ""
aws_profile_name       = ""
document_directory     = ""
dynamodb_table_name    = ""
enable_data_encryption = true
enable_data_version    = "Enabled"
