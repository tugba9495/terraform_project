module "aws_lb_target_group" {
source = "../../child_module/loadbalancer"
target_group_name = "load_balancer_target_group"
target_group_port = 80
target_group_protocol = "HTTP"
target_group_vpc_id = module.aws_vpc.vpc_id.output

}