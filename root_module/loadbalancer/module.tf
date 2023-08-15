data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    path = "../../root_module/vpc/terraform.tfstate"
  }
}