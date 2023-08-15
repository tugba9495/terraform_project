# resource "aws_alb" "load_balancer" {
#     name = "wordpress-terraform-jenkins-lb"
#     internal = false
#     load_balancer_type = "application"
#     security_groups = 
  
# }
resource "aws_lb_target_group" "load_balancer_target_group" {
    name = var.target_group_name
  
    port = var.target_group_port
    protocol = var.target_group_protocol
    vpc_id = var.target_group_vpc_id
    health_check {
    port = 3306
    healthy_threshold = 6
    unhealthy_threshold = 2
    timeout = 2
    interval = 5
    
  }
  tags = merge(local.common_tags,{
        Name = replace(local.name,"rtype","target_load_balancer")
    })
}