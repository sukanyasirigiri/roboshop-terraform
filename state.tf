terraform {
  backend "s3" {
    bucket = "terraform-ra"
    key    = "roboshop/dev/terraform.tfstate"
    region = "us-east-1"
  }
}
