variable "env" {
  type = string
  description = "define environment"
  default = "dev"
}

variable "vpc_cidr" {
    type = string
    description = "cidr for vpc"
}
variable "public_subnet_cidr_1" {
  type = string
  description = "define cidr block for public_subnet_1"
}
variable "public_subnet_cidr_2" {
  type = string
  description = "define cidr block for public_subnet_2"
}
variable "public_subnet_cidr_3" {
  type = string
  description = "define cidr block for public_subnet_3"
}
variable "private_subnet_cidr_1" {
  type = string
  description = "define cidr block for private_subnet_1"
}
variable "private_subnet_cidr_2" {
  type = string
  description = "define cidr block for private_subnet_2"
}
variable "private_subnet_cidr_3" {
  type = string
  description = "define cidr block for private_subnet_3"
}
variable "route_cidr" {
    type = string
    description = "define cidr block for public route"
  
}
variable "route_for_private_route" {
  
  type = string
  description = "define cidr block for private route"
}





