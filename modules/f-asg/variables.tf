variable "mod_asg_desired_capacity" {
  type    = number
  default = 0
}
variable "mod_asg_max_size" {
  type    = number
  default = 0
}
variable "mod_asg_min_size" {
  type    = number
  default = 0
}
variable "mod_lt_version" {
  type    = string
  default = ""
}
variable "mod_lt_id" {
  type    = string
  default = ""
}
variable "mod_availability_zones" {
  type    = list
  default = []
}
variable "mod_alb_target_group_arn" {
  type    = list
  default = []
}
variable "mod_vpc_id" {
  type    = string
  default = ""
}
variable "mod_private_subnet_id" {
  type    = list
  default = []
}
variable "mod_asg_name" {
  type    = string
  default = "skillup-asg-mj.salceda-00"
}
variable "extra_tags" {
  default = [
    {
      key                 = "GBL_CLASS_0"
      value               = "SERVICE"
      propagate_at_launch = true
    },
    {
      key                 = "GBL_CLASS_1"
      value               = "TEST"
      propagate_at_launch = true
    },
  ]
}