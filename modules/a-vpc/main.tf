resource "aws_vpc" "vpc" {
  cidr_block           = var.mod_vpc_cidr
  enable_dns_hostnames = var.mod_edh
  enable_dns_support   = var.mod_eds
  tags = merge(
    local.gbl_tag ,
    {
        Name        = var.mod_vpc_name
    })
}