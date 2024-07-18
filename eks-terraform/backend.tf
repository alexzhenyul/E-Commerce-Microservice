terraform {
  backend "s3" {
    bucket = "goofy-terraform-tfstate" 
    key    = "eks/e-commerce/terraform.tfstate"
    region = "ap-southeast-4"
  }
}