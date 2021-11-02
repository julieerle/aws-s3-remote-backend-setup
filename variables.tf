locals {
  owner = "julie.erlemeier@hashicorp.com"
  team  = "terraform-cli-support"

  common_tags = {
    owner = local.owner
    team  = local.team
  }
}

variable "aws_region" {
  description = "Infra will be provisioned in this AWS region (Oregon)."
  default     = "us-west-2"
  type        = string
}
