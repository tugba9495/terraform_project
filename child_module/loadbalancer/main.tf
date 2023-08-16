
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

resource "aws_lb" "load_balancer" {
  name               = var.load_balancer_name
  load_balancer_type = var.load_balancer_type
  internal           = false
  subnets            = var.load_balancer_subnets
  security_groups    = var.load_balancer_security_group
  enable_deletion_protection = false
  enable_http2       = true
}