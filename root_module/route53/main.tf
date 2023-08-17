data "aws_route53_zone" "selected" {
  name = "tugba.link."

 }
module "aws_route53_record" {
    source =   "../../child_module/route53"
    aws_route53_zone_id =  = data.aws_route53_zone.selected.zone_id
    wordpress_a_rescord_name = "wordpress.tugba.link"
    aws_route53_record_type = "A"
    aws_route53_record_ttl = "300"
  
}
