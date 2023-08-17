################ EC2 INSTANCE ############

resource "aws_instance" "wordpress_server_instance" {
    ami = data.aws_ami.amazon_linux_2023_ami.id
    key_name = var.key_name
    associate_public_ip_address = true

    subnet_id = data.aws_subnet.subnet_id.id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.wordpress-sg.id]
    user_data = file("user.sh")
    
    tags = merge(local.common_tags, {
        Name = "wordpress_server_instance"
    })
}

################# SECURITY GROUP ###############
resource "aws_security_group" "wordpress-sg" {
    name = "allow_ssh_for_wordpress_sg"
    vpc_id =  "vpc-00ee488fe317439e7"
    description = "open ports 22 to your local ip"
}

################### SECURITY GROUP INGRESS RULE FOR 22 #############
resource "aws_security_group_rule" "port_22_open" {
    type = "ingress"
    from_port = var.aws_security_group_rule_from_port_22
    to_port = var.aws_security_group_rule_to_port_22
    protocol = "tcp"
    cidr_blocks = var.cidr_block_for_ingress_security_group_22
    security_group_id = aws_security_group.wordpress-sg.id  
}

######################### SECURITY GROUP INGRESS RULE FOR 80 ###########
resource "aws_security_group_rule" "port_80_open" {
    type = "ingress"
    from_port = var.aws_security_group_rule_from_80
    to_port = var.aws_security_group_rule_to_port_80
    protocol = "tcp"
    cidr_blocks = var.cidr_blocks_for_ingress_security_group_80
    security_group_id = aws_security_group.wordpress-sg.id
}

######################### SECURITY GROUP INGRESS RULE FOR 3306 ###########
resource "aws_security_group_rule" "port_3306_open" {
    type = "ingress"
    from_port = var.aws_security_group_rule_from_3306
    to_port = var.aws_security_group_rule_to_3306
    protocol = "tcp"
    cidr_blocks = var.cidr_blocks_for_ingress_security_group_3306
    security_group_id = aws_security_group.wordpress-sg.id
}
