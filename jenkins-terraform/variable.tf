variable "project_name" {
  default = "E-commerce"
  description = "project name"
}
variable "environment" {
  default = "stage"
  description = "project environment"
}
variable "aws_region" {
  default = "ap-southeast-4"
  description = "aws region"
}
variable "instance_types" {
  default = "t3.large"
  description = "aws ec2 instance type"
}