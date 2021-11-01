# tags to assign to all resources
locals {

  common_tags = {
    owner = "julie.erlemeier@hashicorp.com"
    team  = "terraform-cli-support"
  }
}

variable "aws_region" {
  description = "Infra will be provisioned in this AWS region (Oregon)."
  default     = "us-west-2"
  type        = string
}
