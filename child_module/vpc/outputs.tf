output "vpc_id" {
    value = aws_vpc.wordpress_vpc.id
  
}
output "private_subnet_1_id" {
    value = aws_subnet.private_subnet_1.id
  
}
output "private_subnet_3_id" {
    value = aws_subnet.private_subnet_3.id
  
}