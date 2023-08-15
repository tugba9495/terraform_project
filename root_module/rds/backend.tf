terraform {
  backend "s3" {
    bucket = "terraform-aws-learning"
    key = "rds/terraform.tfstate"
    region = "us-west-1"
    
    # dynamodb_table = "cloudformation-template"
    
  }
}