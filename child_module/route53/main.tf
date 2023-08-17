data "aws_route53_zone" "selected" {
  name = "tugba.link."

}
resource "aws_route53_record" "wordpress_a_record" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = var.jenkins_a_rescord
  type    = "A"
  ttl     = "300"
  records = [aws_instance.jenkins_instance.public_ip]

}