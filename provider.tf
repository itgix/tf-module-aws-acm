provider "aws" {
  alias  = "shared_services"
  region = var.aws_region
  # TODO: figure out how to handle hardcoded acc IDs
  assume_role {
    #role_arn = "arn:aws:iam::905418054535:role/itgix-landing-zones"
    role_arn = var.shared_services_iam_role
    # optional session_name param - specifies a name for the session that is created when Terraform assumes an IAM role. This name is used to identify the session in AWS CloudTrail logs, which helps in auditing and tracking actions performed by that session.
    session_name = "terraform-acm-certs-module"
  }
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #   version = "~> 4"
    }
  }
}
