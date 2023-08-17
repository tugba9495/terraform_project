variable "dev" {
    type = string
    default = "route53"
  
}
variable "wordpress_a_rescord_name" {
  description = "wordpress server a record"
  type        = string
  # default     = "wordpress.tugba.link"

}
variable "aws_route53_zone_id" {
  
  type = string
}
variable "aws_route53_record_type" {
  type = string

  
}
