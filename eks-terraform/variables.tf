variable "kubernetes_version" {
  default     = 1.29
  description = "kubernetes version"
}
variable "project_name" {
  default = "E-commerce"
  description = "project name"
}
variable "environment" {
  default = "stage"
  description = "project environment"
}
variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "default CIDR range of the VPC"
}
variable "aws_region" {
  default = "ap-southeast-4"
  description = "aws region"
}
variable "private_subnet_cidr_blocks" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
  description = "aws private subnets"
}
variable "public_subnet_cidr_blocks" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "aws public subnets"
}
variable "ami_type" {
  default = "AL2_x86_64"
  description = "aws eks ami type"
}
variable "instance_types" {
  default = ["t3.medium"]
  description = "aws eks instance type"
}
