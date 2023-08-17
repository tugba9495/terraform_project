# data "aws_route53_zone" "selected" {
#   name = "tugba.link."

# }
resource "aws_route53_record" "wordpress_a_record" {
  zone_id = var.aws_route53_zone_id
  name    = var.wordpress_a_rescord_name
  type    = var.aws_route53_record_type
 
  
  alias {
    name = "wordpress-load-balancer-1132891715.us-west-1.elb.amazonaws.com"
    zone_id = "Z368ELLRRE2KJ0"
    evaluate_target_health = true
  }

}