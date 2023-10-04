resource "aws_subnet" "public_subnet" {
  count = 2
  vpc_id                  = var.mod_vpc_id
  cidr_block              = "10.5.${count.index+1}.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.mod_availability_zones[count.index]
  tags = merge(
    local.gbl_tag,
    {
        Name        = "${var.mod_pubsubnet_name}${(count.index + 1)}"
        
    })
}
resource "aws_subnet" "private_subnet" {
  count = 2
  vpc_id                  = var.mod_vpc_id
  cidr_block              = "10.5.${count.index+3}.0/24"
  availability_zone       = var.mod_availability_zones[count.index]
  tags = merge(
    local.gbl_tag,
    {
        Name        = "${var.mod_prisubnet_name}${(count.index + 1)}"
    })
}