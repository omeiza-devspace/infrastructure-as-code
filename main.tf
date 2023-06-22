# create vpc
module "vpc" {
  source = "./modules/vpc"

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
module "security_groups" {
  source = "./modules/security-group"

  vpc_id   = module.vpc.vpc_id
  vpc_name = module.vpc.vpc_name
}


module "app_load_balancer" {
  source = "./modules/alb"

  vpc_id                         = module.vpc.vpc_id
  vpc_name                       = module.vpc.vpc_name
  public_alb_security_group_id   = module.security_groups.public_alb_security_group_id
  internal_alb_security_group_id = module.security_groups.internal_alb_security_group_id

  public_subnet_az1_id = module.vpc.public_subnet_az1_id
  public_subnet_az2_id = module.vpc.public_subnet_az2_id

  private_proxy_subnet_az1_id   = module.vpc.private_proxy_subnet_az1_id
  private_proxy_subnet_az2_id   = module.vpc.private_proxy_subnet_az2_id
  private_compute_subnet_az1_id = module.vpc.private_compute_subnet_az1_id
  private_compute_subnet_az2_id  = module.vpc.private_compute_subnet_az2_id
}