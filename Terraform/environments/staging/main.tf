terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>5.43"
    }
  }
  required_version = ">= 1.2.0"
}