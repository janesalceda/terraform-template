variable "mod_vpc_id" {
  type    = string
  default = ""
}
variable "mod_aws_region" {
  type    = string
  default = ""
}
variable "mod_vpce_name" {
  type    = string
  default = "skillup-vpce-mj.salceda-001"
}
locals {
  gbl_tag = {
    GBL_CLASS_0 = "SERVICE"
    GBL_CLASS_1 = "TEST"
  }
}