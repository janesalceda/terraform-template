resource "aws_internet_gateway" "igw" {
  vpc_id = var.mod_vpc_id
  
}
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = var.mod_vpc_id
  service_name = "com.amazonaws.${var.mod_aws_region}.s3"
  tags = merge(
    local.gbl_tag ,
    {
        Name        = var.mod_vpce_name
    })
}