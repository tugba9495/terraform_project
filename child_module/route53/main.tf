data "aws_route53_zone" "selected" {
  name = "tugba.link."

}
resource "aws_route53_record" "wordpress_a_record" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = var.wordpress_a_rescord
  type    = var.aws_route53_record_type
  ttl     = var.aws_route53_record_ttl
  records = [aws_instance.jenkins_instance.public_ip]
  alias {
    name = "wordpress-load-balancer-1132891715.us-west-1.elb.amazonaws.com"
    zone_id = "Z368ELLRRE2KJ0"
  }

}