resource "aws_db_instance" "database" {
    identifier = var.identifier
    allocated_storage = var.allocated_storage
    engine = var.engine
    engine_version = var.engine_version
    instance_class = var.instance_class
    db_name = var.db_name
    port = var.port
    username = var.username
    password = var.password
    db_subnet_group_name = var.db_subnet_group_name
    # subnet_ids = var.subnet_ids
    vpc_security_group_ids = [aws_security_group.database-sg.id]  
    publicly_accessible    = false
    skip_final_snapshot    = true
    iam_database_authentication_enabled = true
    
    tags = merge(local.common_tags,{
        Name = replace(local.name,"rtype","terraform_db_instance_mysql")
    })
}

resource "aws_security_group" "database-sg" {
    name = "allow_ingress_3306_database_sg"
    description = "allow ingress 3306"
    vpc_id = "vpc-00ee488fe317439e7"
    
  
}

resource "aws_security_group_rule" "database_3306_open" {
    type = "ingress"
    from_port = var.aws_security_group_rule_from_3306
    to_port = var.aws_security_group_rule_to_3306
    protocol = "tcp"
    cidr_blocks = var.cidr_blocks_for_ingress_security_group_3306
 

    security_group_id = aws_security_group.database-sg.id  
}
