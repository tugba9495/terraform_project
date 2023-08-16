module "aws_lb_target_group" {
source = "../../child_module/loadbalancer"
target_group_name = "loadbalancertargetgroup"
target_group_port = 80
target_group_protocol = "HTTP"
target_group_vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

}
module "aws_lb" {
source = "../../child_module/loadbalancer"
load_balancer_name = "wordpress-load-balancer"
load_balancer_type = "application"
# load_balancer_subnets = 
load_balancer_subnets = data.terraform_remote_state.vpc.outputs.private_subnet_1_id.private_subnet_3_id

   
    
}
  
