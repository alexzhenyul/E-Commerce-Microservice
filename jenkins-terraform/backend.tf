terraform {
  backend "s3" {
    bucket = "goofy-terraform-tfstate" 
    key    = "E-commerce/jenkins/terraform.tfstate"
    region = "ap-southeast-4"
  }
}