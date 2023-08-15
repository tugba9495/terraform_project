variable "env" {
    type = "string"
    default = "loadbalancer"
  
}

variable "target_group_name" {
    type = string
    

  
}

variable "target_group_port" {
    type = number
  
}
variable "target_group_protocol" {
    type = string
  
}
variable "target_group_vpc_id" {
  type = string
}