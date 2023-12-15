terraform {
  backend "s3" {
    bucket = "soni-general-purpose"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}