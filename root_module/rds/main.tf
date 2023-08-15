module "db" {
    source =   "../../child_module/rds"
    identifier = "testdb"
    engine = "mysql"
    engine_version = "5.7"
    instance_class = "db.t3a.large"
    allocated_storage = 5
    db_name = "testdb"
    username = "tugba"
    password = "123"
    port = "3306"
    vpc_security_group_ids = ["sg-03ea08d89fa7cc5c3"]
    db_subnet_group_name = "private_subnet_1"
    # subnet_ids = ["subnet-04cdf733a65186815"]


  

    

    
  
}