terraform {
  required_version = ">=1.3.9"

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