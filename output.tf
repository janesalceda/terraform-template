output "public_subnets" {
  description = "Public IP of EC2 instance"
  value       = module.subnet.public_subnet_id
}


# # Elastic IP
# output "bastion-eip" {
#     description = "Get Public IP"
#     value = module.vpc-network.bastion-eip
# }


# # FE-Server
# output "sceate-frontend-server-priv-ip" {
#     description = "Get Public IP"
#     value = module.vpc-network.bastion-eip
# }

# # BE-Server
# output "sceate-backend-server-priv-ip" {
#     description = "Get Public IP"
#     value = module.vpc-network.bastion-eip
# }


# output "screate-backend-alb-dns-name" {
#   value = module.alb.screate-backend-alb-dns-name
# }


# output "screate-frontend-alb-dns-name" {
#   value = module.alb.screate-frontend-alb-dns-name
# }

# # rds
# output "db_instance_endpoint" {
#   description = "The connection endpoint"
#   value = module.rds.db_instance_endpoint
# }