
#################### VPC ##################
resource "aws_vpc" "wordpress_vpc" {
  cidr_block       = var.vpc_cidr

  tags = {
    Name = replace(local.name, "rtype", "wordpress_vpc")
    
  }
}
################ PUBLIC SUBNET #############
resource "aws_subnet" "public_subnet_1" {
  vpc_id = aws_vpc.wordpress_vpc.id
  cidr_block = var.public_subnet_cidr_1
  tags = {
    Name = "public_subnet_1"
  }
  
}
resource "aws_subnet" "public_subnet_2" {
  vpc_id = aws_vpc.wordpress_vpc.id
  cidr_block = var.public_subnet_cidr_2
  tags = {
    Name = "public_subnet_2"
  }
  
  
}
resource "aws_subnet" "public_subnet_3" {
  vpc_id = aws_vpc.wordpress_vpc.id
  cidr_block = var.public_subnet_cidr_3
  tags = {
    Name = "public_subnet_3"
  }
  
  ################ PRIVATE SUBNETS  ##############
}
resource "aws_subnet" "private_subnet_1" {
  vpc_id = aws_vpc.wordpress_vpc.id
  cidr_block = var.private_subnet_cidr_1
  tags = {
    Name = "private_subnet_1"
  }
  
  
}
resource "aws_subnet" "private_subnet_2" {
  vpc_id = aws_vpc.wordpress_vpc.id
  cidr_block = var.private_subnet_cidr_2
  tags = {
    Name = "private_subnet_2"
  }
  
}
resource "aws_subnet" "private_subnet_3" {
  vpc_id = aws_vpc.wordpress_vpc.id
  cidr_block = var.private_subnet_cidr_3
  tags = {
    Name = "private_subnet_3"
  }
  
}
##################### INTERNET GATEWAY ###################
resource "aws_internet_gateway" "wordpress_internetgateway" {
  vpc_id = aws_vpc.wordpress_vpc.id
  tags = {
    Name = replace(local.name, "rtype", "wordpress_internetgateway")
  }
}
###################### PUBLIC ROUTE TABLE ##################
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.wordpress_vpc.id

  route {
    cidr_block = var.route_cidr
    gateway_id = aws_internet_gateway.wordpress_internetgateway.id
  }

  

  tags = {
    Name = replace(local.name, "rtype", "wordpress_public_route_table")
  }
}
##################### PUBLIC ROUTE TABLE ASSOCIATION ###################
resource "aws_route_table_association" "public_subnet_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "public_subnet_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "public_subnet_3" {
  subnet_id      = aws_subnet.public_subnet_3.id
  route_table_id = aws_route_table.public_route_table.id
}
####################### PRIVATE ROUTE TABLE ###############
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.wordpress_vpc.id

  route {
    cidr_block     = var.route_for_private_route
    nat_gateway_id = aws_nat_gateway.wordpress_nat_gateway.id
  }
  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}_private_rtb"
    }
  )
}




resource "aws_nat_gateway" "wordpress_nat_gateway" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.public_subnet_1.id
 

  tags = {
    Name = "wordpres_natgateway"
  }
}
resource "aws_eip" "elastic_ip" {
  
  domain = "vpc"
}

resource "aws_route_table_association" "private_subnet_1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_route_table.id
}
resource "aws_route_table_association" "private_subnet_2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_subnet_3" {
  subnet_id      = aws_subnet.private_subnet_3.id
  route_table_id = aws_route_table.private_route_table.id
}




