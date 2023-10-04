variable "mod_pubsubnet_name" {
  type    = string
  default = ""
}
variable "mod_prisubnet_name" {
  type    = string
  default = ""
}
variable mod_availability_zones {
    type = list(any)
    default = []
}
variable "mod_vpc_id" {
  type    = string
  default = ""
}
locals {
  gbl_tag = {
    GBL_CLASS_0 = "SERVICE"
    GBL_CLASS_1 = "TEST"
  }
}