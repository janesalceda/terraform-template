variable "mod_vpc_cidr" {
  type    = string
  default = ""
}
variable "mod_edh" {
  type = bool
  default = true
}
variable "mod_eds" {
  type = bool
  default = false
}
variable "mod_vpc_name" {
  type    = string
  default = ""
}

locals {
  gbl_tag = {
    GBL_CLASS_0 = "SERVICE"
    GBL_CLASS_1 = "TEST"
  }
}