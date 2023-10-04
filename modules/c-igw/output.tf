output "igw_id" {
  value = aws_internet_gateway.igw.id
}
output "vpce_id" {
  value = aws_vpc_endpoint.s3.id
}
