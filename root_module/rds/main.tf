module "db" {
    source =   "../../child_module/rds"
    identifier = "testdb"
    engine = "mysql"
    engine_version = "5.7"
    instance_class = "db.m5.large"
    allocated_storage = 5
    db_name = "terraformdb"
    username = "tugba"
    password = "Tugba12395"
    port = "3306" #
  
    db_subnet_group_name = "rds_subnet_group"
    # subnet_ids = ["subnet-04cdf733a65186815"]


  

    

  
}