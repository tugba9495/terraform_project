variable "allocated_storage" {
    type = number
  
}
variable "engine" {
    type = string

  
}
variable "engine_version" {
  
  type = string

}
variable "instance_class" {
    type = string
  
}
variable "username" {
    type = string
  
}
variable "password" {
    type = string
  
}
variable "db_subnet_group_name" {
    type = string
  
}

variable "identifier" {
  
  type = string
}
variable "db_name" {
    type = string
  
}
variable "port" {
    type = string
  
}
# variable "subnet_ids" {
#     type = list(string)
  
# }
variable "env" {
    type = string
    default = "rds"
  
}
variable "aws_security_group_rule_from_3306" {
  type = number
  description = "port for ingress rule"
  default = 3306
  
}
variable "aws_security_group_rule_to_3306" {
  type = number
  description = "port for ingress rule"
  default = 3306
  
}
variable "cidr_blocks_for_ingress_security_group_3306" {
  type = list(string)
  description = "security group cidr block"
  default = [ "98.253.243.198/32" ]
  
}
