module "db" {
    source =   "../../child_module/rds"
    identifier = "testdb"
    engine = "mysql"
    engine_version = "5.7"
    instance_class = "db.m5.large"
    allocated_storage = 5
    db_name = "testdb"
    username = "tugba"
    password = "123"
    port = "3306"
    vpc_security_group_ids = ["sg-03ea08d89fa7cc5c3"]
    db_subnet_group_name = "rds_subnet_group"
    # subnet_ids = ["subnet-04cdf733a65186815"]


  

    

    
  
}