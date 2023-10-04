variable "mod_public_subnet_id" {
  type    = list
  default = []
}
variable "mod_private_subnet_id" {
  type    = list
  default = []
}
variable "mod_vpce_id" {
  type    = string
  default = ""
}
variable "mod_prisubnet_name" {
  type    = string
  default = ""
}
variable mod_availability_zones {
    type = list
    default = []
}
variable "mod_vpc_id" {
  type    = string
  default = ""
}
variable "mod_vpc_cidr" {
  type    = string
  default = ""
}
variable "mod_igw_id" {
  type    = string
  default = ""
}
variable "mod_pubrtb_name" {
  type    = string
  default = ""
}
variable "mod_prirtb_name" {
  type    = string
  default = ""
}
locals {
  gbl_tag = {
    GBL_CLASS_0 = "SERVICE"
    GBL_CLASS_1 = "TEST"
  }
}