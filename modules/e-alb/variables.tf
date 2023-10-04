variable "mod_availability_zones" {
    type = list
    default = []
}
variable "mod_lb_tg_name" {
  type    = string
  default = ""
}
variable "mod_lb_sg_name" {
  type    = string
  default = "skillup-alb-sg-mj.salceda-001"
}
variable "mod_vpc_id" {
  type    = string
  default = ""
}
variable "mod_public_subnet_id" {
  type    = list
  default = []
}
variable "mod_private_subnet_id" {
  type    = list
  default = []
}
variable "mod_route_53_id" {
  type    = string
  default = ""
}
variable "mod_alb_name" {
  type    = string
  default = "skillup-alb-mj.salceda-001"
}
variable "mod_route53_record" {
  type    = string
  default = ""
}
locals {
  gbl_tag = {
    GBL_CLASS_0 = "SERVICE"
    GBL_CLASS_1 = "TEST"
  }
}