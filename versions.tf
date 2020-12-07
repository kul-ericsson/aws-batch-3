terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    mysql = {
      source = "terraform-providers/mysql"
    }
    null = {
      source = "hashicorp/null"
    }
  }
  required_version = ">= 0.13"
}