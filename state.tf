terraform {
  backend "s3" {
    bucket = "terraform-d81"
    key    = "tools/terraform.tfstate"
    region = "us-east-1"
  }
}