variable "aws_region" {
  type    = string
  default = ""
}
variable "vpc_cidr" {
  type    = string
  default = ""
}
variable "edh" {
  type    = bool
  default = true
}
variable "vpc_name" {
  type    = string
  default = ""
}

variable "ec2_name" {
  type    = string
  default = ""
}
variable "availability_zones" {
  type    = list(any)
  default = []
}
variable "key_pair" {
  type    = string
  default = ""
}
variable "lt_name" {
  type    = string
  default = ""
}
variable "image_id" {
  type    = string
  default = ""
}
variable "iam_instance_profile" {
  type    = string
  default = ""
}
variable "instance_type" {
  type    = string
  default = ""
}
variable "vpc_security_group_ids" {
  type    = list(any)
  default = []
}
variable "pubsubnet_name" {
  type    = string
  default = ""
}
variable "prisubnet_name" {
  type    = string
  default = ""
}
variable "eds" {
  type    = bool
  default = true
}
variable "asg_desired_capacity" {
  type    = number
  default = 0
}
variable "asg_max_size" {
  type    = number
  default = 0
}
variable "asg_min_size" {
  type    = number
  default = 0
}
variable "lt_version" {
  type    = string
  default = ""
}
variable "alb_name" {
  type    = string
  default = ""
}
variable "lb_tg_name" {
  type    = string
  default = ""
}
variable "route_53_id" {
  type    = string
  default = ""
}
variable "team" {
  type    = string
  default = ""
}
variable "project" {
  type    = string
  default = ""
}
variable "owner" {
  type    = string
  default = ""
}
variable "route53_record" {
  type    = string
  default = ""
}