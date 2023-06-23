# create vpc
module "network" {
  source = "./modules/network"

  region   = var.region
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr

  az1_gateway_subnet_cidr = var.az1_gateway_subnet_cidr
  az1_proxy_subnet_cidr   = var.az1_proxy_subnet_cidr
  az1_compute_subnet_cidr = var.az1_compute_subnet_cidr

  az2_gateway_subnet_cidr = var.az2_gateway_subnet_cidr
  az2_proxy_subnet_cidr   = var.az2_proxy_subnet_cidr
  az2_compute_subnet_cidr = var.az2_compute_subnet_cidr
}

# create  security groups
module "security_group" {
  source = "./modules/security_group"

  vpc_id   = module.network.vpc_id
  vpc_name = module.network.vpc_name
}


module "app_load_balancer" {
  source = "./modules/load_balancer"

  vpc_id                         = module.network.vpc_id
  vpc_name                       = module.network.vpc_name
  public_alb_security_group_id   = module.security_group.public_alb_security_group_id
  internal_alb_security_group_id = module.security_group.internal_alb_security_group_id

  public_gateway_subnet_az1_id = module.network.public_gateway_subnet_az1_id
  public_gateway_subnet_az2_id = module.network.public_gateway_subnet_az2_id

  private_proxy_subnet_az1_id   = module.network.private_proxy_subnet_az1_id
  private_proxy_subnet_az2_id   = module.network.private_proxy_subnet_az2_id
  private_compute_subnet_az1_id = module.network.private_compute_subnet_az1_id
  private_compute_subnet_az2_id = module.network.private_compute_subnet_az2_id
}

module "compute_resource" {
  source = "./modules/ec2_resource"

  vpc_name = module.network.vpc_name

  private_proxy_subnet_az1_id   = module.network.private_proxy_subnet_az1_id
  private_proxy_subnet_az2_id   = module.network.private_proxy_subnet_az2_id
  private_compute_subnet_az1_id = module.network.private_compute_subnet_az1_id
  private_compute_subnet_az2_id = module.network.private_compute_subnet_az2_id
  public_gateway_subnet_az1_id  = module.network.public_gateway_subnet_az1_id
  public_gateway_subnet_az2_id  = module.network.public_gateway_subnet_az2_id

  nginx_max_instance_size = var.nginx_max_instance_size
  nginx_min_instance_size = var.nginx_min_instance_size
  nginx_desired_capacity  = var.nginx_desired_capacity

  app_max_instance_size = var.app_max_instance_size
  app_min_instance_size = var.app_min_instance_size
  app_desired_capacity  = var.app_desired_capacity

  bastion_max_instance_size = var.bastion_max_instance_size
  bastion_min_instance_size = var.bastion_min_instance_size
  bastion_desired_capacity  = var.bastion_desired_capacity

  app_security_group_id     = module.security_group.app_security_group_id
  nginx_security_group_id   = module.security_group.nginx_security_group_id
  bastion_security_group_id = module.security_group.bastion_security_group_id

  ssh_key_pair = var.ssh_key_pair
}