variable "env" {
  type = string
  description = "define environment"
  default = "dev"
}

variable "vpc_cidr" {
    type = string
    description = "cidr for vpc"
    default = "10.0.0.0/16"
  
}