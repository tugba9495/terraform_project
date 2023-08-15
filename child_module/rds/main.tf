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
    vpc_security_group_ids = var.vpc_security_group_ids
    publicly_accessible    = true
    skip_final_snapshot    = true
    iam_database_authentication_enabled = true
    tags = merge(local.common_tags,{
        Name = replace(local.name,"rtype","terraform_db_instance_mysql")
    })


}