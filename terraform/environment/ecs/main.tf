provider "aws" {
  region = var.region
}


terraform {
  backend "s3" {
    bucket = "NC-state-file"
    region = "eu-west-2"
    key    = "state/terraform.tfstate"
  }
}
