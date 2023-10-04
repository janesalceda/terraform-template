terraform {
  backend "s3" {
    acl    = "private"
    bucket = "skillup-s3-bucket-mj.salceda"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}

#VPC
module "vpc" {
  source       = "./modules/a-vpc"
  mod_vpc_cidr = var.vpc_cidr
  mod_eds      = var.eds
  mod_vpc_name = var.vpc_name
}

# SUBNETS
module "subnet" {
  source                 = "./modules/b-subnet"
  mod_vpc_id             = module.vpc.vpc_id
  mod_prisubnet_name     = var.prisubnet_name
  mod_pubsubnet_name     = var.pubsubnet_name
  mod_availability_zones = var.availability_zones
}
# INTERNET GATEWAY
module "igw" {
  source         = "./modules/c-igw"
  mod_vpc_id     = module.vpc.vpc_id
  mod_aws_region = var.aws_region
}
# ROUTE TABLE
module "route_table" {
  source                = "./modules/d-rtb"
  mod_vpc_id            = module.vpc.vpc_id
  mod_igw_id            = module.igw.igw_id
  mod_public_subnet_id  = module.subnet.public_subnet_id
  mod_private_subnet_id = module.subnet.private_subnet_id
  mod_vpc_cidr          = var.vpc_cidr
  mod_vpce_id           = module.igw.vpce_id
}
# LAUNCH TEMPLATE
module "launch_template" {
  source                   = "./modules/g-ec2"
  mod_ec2_name             = var.ec2_name
  mod_availability_zones   = var.availability_zones
  mod_key_pair             = var.key_pair
  mod_lt_name              = var.lt_name
  mod_image_id             = var.image_id
  mod_iam_instance_profile = var.iam_instance_profile
  mod_instance_type        = var.instance_type
  mod_vpc_id               = module.vpc.vpc_id
  mod_owner                = var.owner
  mod_project              = var.project
  mod_team                 = var.team
  mod_alb_sg_ids = module.alb.alb_sg_ids
}
# ALB
module "alb" {
  source                 = "./modules/e-alb"
  mod_alb_name           = var.alb_name
  mod_availability_zones = var.availability_zones
  mod_lb_tg_name         = var.lb_tg_name
  mod_vpc_id             = module.vpc.vpc_id
  mod_public_subnet_id   = module.subnet.public_subnet_id
  mod_route_53_id        = var.route_53_id
  mod_route53_record = var.route53_record
}
# ASG
module "asg" {
  source                   = "./modules/f-asg"
  mod_availability_zones   = var.availability_zones
  mod_asg_desired_capacity = var.asg_desired_capacity
  mod_asg_max_size         = var.asg_max_size
  mod_asg_min_size         = var.asg_min_size
  mod_lt_id                = module.launch_template.lt_id
  mod_private_subnet_id    = module.subnet.private_subnet_id
  mod_lt_version           = var.lt_version
  mod_alb_target_group_arn = module.alb.alb_tg_arn
}