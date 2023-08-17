data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "terraform-aws-learning"
    key = "vpc/terraform.tfstate"
    region = "us-west-1"
  }
}
data "terraform_remote_state" "ec2" {
  backend = "s3"

  config = {
    bucket = "terraform-aws-learning"
    key = "loadbalancer/terraform.tfstate"
    region = "us-west-1"
  }
}