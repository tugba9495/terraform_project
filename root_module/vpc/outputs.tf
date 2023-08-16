output "vpc_id" {
  
  value = module.aws_vpc.vpc_id
}
output "private_subnet_1_id" {
    value = module.aws_vpc.private_subnet_1_id
  
}
output "private_subnet_3_id" {
    value = module.aws_vpc.private_subnet_3_id
}