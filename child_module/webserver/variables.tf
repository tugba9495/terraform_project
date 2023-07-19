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