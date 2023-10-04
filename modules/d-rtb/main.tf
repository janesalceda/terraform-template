resource "aws_route_table" "pubroute_table" {
  count=1
  vpc_id = var.mod_vpc_id

  route {
    cidr_block           = var.mod_vpc_cidr
    gateway_id = "local"
  }

  route {
    cidr_block        = "0.0.0.0/0"
    gateway_id = var.mod_igw_id
  }

  tags = merge(
    local.gbl_tag ,
    {
        Name        = "skillup-public-rtb-mj.salceda-00${count.index+1}"
    })
}
resource "aws_route_table" "priroute_table" {
  count = length(var.mod_private_subnet_id)
  vpc_id = var.mod_vpc_id

  route {
    cidr_block           = var.mod_vpc_cidr
    gateway_id = "local"
  }

  tags = merge(
    local.gbl_tag ,
    {
        Name        = "skillup-private-rtb-mj.salceda-00${count.index+1}"
    })
}
resource "aws_route_table_association" "publicartb" {
    count          = length(aws_route_table.pubroute_table.*.id)
    subnet_id      = var.mod_public_subnet_id[count.index]
    route_table_id = aws_route_table.pubroute_table[count.index].id
}
resource "aws_route_table_association" "privateartb" {
    count          = length(var.mod_private_subnet_id)
    subnet_id      = var.mod_private_subnet_id[count.index]
    route_table_id = aws_route_table.priroute_table[count.index].id
}

resource "aws_vpc_endpoint_route_table_association" "avpce" {
  count = length(var.mod_private_subnet_id)
  route_table_id  = aws_route_table.priroute_table[count.index].id
  vpc_endpoint_id = var.mod_vpce_id
}