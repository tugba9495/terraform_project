terraform {
  backend "s3" {
    bucket = "terraform-aws-learning"
    key    = "ec2/terraform.tfstate"
    region = "us-west-1"

    dynamodb_table = "cloudformation-template"

  }
}