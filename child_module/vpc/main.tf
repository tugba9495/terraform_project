resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  
 

  tags = {
    Name = replace(local.name, "rtype", "wordpress_vpc")
    
    
  }
}