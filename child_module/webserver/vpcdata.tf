data "terraform_remote_state" "vpc_id" {
    backend = "s3"
    config = {
      bucket = "terraform-aws-learning"
      key = "vpc/terraform.tfstate"
      region = "us-west-1"
    }
  
}