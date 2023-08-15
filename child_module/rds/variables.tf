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
variable "vpc_security_group_ids" {
  type = list(string)
  
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
variable "subnet_ids" {
    type = list(string)
  
}
variable "env" {
    type = string
    default = "rds"
  
}

