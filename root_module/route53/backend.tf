terraform {
  backend "s3" {
    bucket = "terraform-aws-learning"
    key = "route53/terraform.tfstate"
    region = "us-west-1"
    
    # dynamodb_table = "cloudformation-template"
    
  }
}