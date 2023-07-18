module "aws_vpc" {
source = "../../child_module/vpc"
vpc_cidr = "10.0.0.0/16"
} 