module "aws_vpc" {
source                    = "../../child_module/vpc"
vpc_cidr                  = "10.0.0.0/16"
public_subnet_cidr_1      =  "10.0.1.0/24"
public_subnet_cidr_2      = "10.0.2.0/24"
public_subnet_cidr_3      = "10.0.3.0/24"
private_subnet_cidr_1     = "10.0.11.0/24"
private_subnet_cidr_2     = "10.0.12.0/24"
private_subnet_cidr_3     = "10.0.13.0/24"
route_cidr                = "0.0.0.0/0"


} 