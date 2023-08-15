output "vpc_security_group_ids" {
  
  value = aws_security_group.wordpress-sg.id
}