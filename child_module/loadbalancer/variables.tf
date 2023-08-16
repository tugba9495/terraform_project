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
    default = "wordpress-load-balancer"
  

}
variable "load_balancer_type" {
    type = string
    default = "application"
  
}
# variable "load_balancer_security_group" {
#   type = list(string)
# }
