# mj.salceda
aws_region     = "eu-west-1"
vpc_cidr       = "10.5.0.0/16"
vpc_name       = "skillup-vpc-mjsalceda-001"
prisubnet_name = "skillup-prisubnet-mjsalceda-00"
pubsubnet_name = "skillup-pubsubnet-mjsalceda-00"

ec2_name = "skillup-ec2-mjsalceda-001"

availability_zones = ["eu-west-1a", "eu-west-1b"]

key_pair = "skillup-key-pair-mj.salceda-001"

lt_name = "skillup-lt-mj.salceda-001"

image_id = "ami-01e9354a964476532"

iam_instance_profile = "skillup-instanceprofile"

instance_type = "t2.micro"

# vpc_security_group_ids = []
asg_desired_capacity = 2
asg_max_size         = 2
asg_min_size         = 2
lt_version           = "$Latest"
alb_name             = "skillup-alb-mjsalceda-001"
lb_tg_name           = "skillup-alb-tg-mjsalceda-001"
route_53_id          = "Z0274460207OCNCO27KQN"
owner                = "mj.salceda"
project              = "COT-CNF"
team                 = "PC"
route53_record="mj.salceda.srphskillup.net"