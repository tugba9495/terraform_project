# locals {
#   region = "us-west-1"
#   stage = "non-prod"
#   project = "wordpress"
#   name = "terraform-${local.stage}-${local.region}-${local.project}-rtype-${var.env}"

#   common_tags = {
#     env = var.env
#     project = local.project
#     team = "cloud"
#     owner = "tugba"
#     managed_by = "terraform"
#   }
# }