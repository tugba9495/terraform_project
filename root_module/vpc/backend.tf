terraform {
  backend "s3" {
    bucket = "terraform-aws-learning"
    dynamodb_table = "cloudformation-template"
  }
}