variable "env" {
    type = string
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

variable "load_balancer_name" {
    type = string
  
}
variable "load_balancer_type" {
    type = string
  
}
# variable "load_balancer_security_group" {
#   type = list(string)
# }
variable "load_balancer_subnets" {
    type = string
  
}