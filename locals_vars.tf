# tags to assign to all resources
locals {

    common_tags = {
        Owner = "julie.erlemeier@hashicorp.com"
        Team = "terraform-cli-support"
  }
}

variable "aws_region" {
    value = "us-west-2"
}