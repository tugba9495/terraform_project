variable "instance_type" {
  type = string
  description = "define instance type"
}
variable "key_name" {
  type = string
  description = "define key name for ec2 instance"

}
variable "env" {
  type = string
  description = "creates environment"
  default = "dev"
  
}
variable "aws_security_group_rule_from_port_22" {
  type = number
  description = "port for ingress rule from "
  default = 22

  
}
variable "aws_security_group_rule_to_port_22" {
  type = number
  description = "port for ingress rule from "
  default = 22

  
}
variable "cidr_block_for_ingress_security_group_22" {
  
  type = list(string)
  description = "security group cidr block"
  default = ["98.227.136.153/32"]
}

variable "aws_security_group_rule_from_80" {
  type = number
  description = "port for ingress rule"
  default = 80
  
}
variable "aws_security_group_rule_to_port_80" {
  type = number
  description = "port for ingress rule"
  default = 80
  
}
variable "cidr_blocks_for_ingress_security_group_80" {
  type = list(string)
  description = "security group cidr block"
  default =  ["0.0.0.0/0"]
  
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
  default = [ "0.0.0.0/0" ]
  
}