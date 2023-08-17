
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
  
  subnets          = ["subnet-04cdf733a65186815","subnet-0bdfdf401da190220"]

  security_groups    = [aws_security_group.wordpress_sg.id]
  enable_deletion_protection = false
  enable_http2       = true
}


resource "aws_security_group" "wordpress_sg" {
  name        = "wordpress-security-group"
  description = "Security group for WordPress servers"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  // Allow inbound traffic on ports 80 and 443
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Allow outbound traffic to all destinations
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb_listener" "wordpress_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = 80
  
  protocol          = "HTTP"
  

  default_action {
    type             = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      status_code  = "200"
      message_body = "OK"
    }
    
  }
}
resource "aws_lb_listener_rule" "wordpress_listener_rule" {
  listener_arn = aws_lb_listener.wordpress_listener.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.load_balancer_target_group.arn
  }
  condition {
    query_string {
      key   = "health"
      value = "check"
    }
  

  
}
}
resource "aws_lb_target_group_attachment" "example" {
  target_group_arn = aws_lb_target_group.load_balancer_target_group.arn
  target_id        = aws_instance.my_ec2_instance.id
  port             = 80
}
