terraform {
  backend "s3" {
    bucket = "goofy-terraform-tfstate" 
    key    = "E-commerce/eks/terraform.tfstate"
    region = "ap-southeast-4"
  }
}