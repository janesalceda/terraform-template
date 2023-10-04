variable mod_ec2_name {
  type    = string
  default = ""
}
variable mod_vpc_id {
  type    = string
  default = ""
}
variable mod_availability_zones {
    type = list
    default = []
}
variable mod_key_pair {
    type = string
    default = ""
}
variable mod_lt_name {
  type    = string
  default = ""
}
variable mod_image_id {
    type = string
    default = ""
}
variable mod_iam_instance_profile {
    type = string
    default = ""
}
variable mod_instance_type {
    type = string
    default = ""
}
variable mod_vpc_security_group_ids {
    type = list
    default = []
}
variable mod_alb_sg_ids {
    type = string
    default = ""
}
variable "mod_team" {
  type    = string
  default = ""
}
variable "mod_project" {
  type    = string
  default = ""
}
variable "mod_owner" {
  type    = string
  default = ""
}
variable "mod_asg_sg_name" {
  type    = string
  default = "skillup-asg-sg-mj.salceda-001"
}

locals {
  gbl_tag = {
    GBL_CLASS_0 = "SERVICE"
    GBL_CLASS_1 = "TEST"
  }
}