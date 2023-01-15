terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.48.0" # Optional but recommended in production
    }
  }
}

provider "aws" {
  region = var.region
}
