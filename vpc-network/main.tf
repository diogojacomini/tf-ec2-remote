terraform {
  required_version = ">=1.3.9"

  backend "s3" {
    bucket = "bucket-tfstate-jac"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-2"
  }
}

provider "aws" {
  region = "us-east-2"

  default_tags {
    tags = {
      owner      = "jacomini"
      projeto    = "terraform"
      managed-by = "terraform"
    }
  }
}
