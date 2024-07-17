provider "aws" {
    region = var.aws_region
}

data "aws_availability_zones" "azs" {}

locals {
  cluster_name = "${var.project_name}-eks-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}

module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = "5.9.0"

    name = "${var.project_name}-vpc"
    cidr = var.vpc_cidr
    private_subnets = var.private_subnet_cidr_blocks
    public_subnets = var.public_subnet_cidr_blocks
    azs = data.aws_availability_zones.azs.names 
    
    enable_nat_gateway = true
    single_nat_gateway = true
    enable_dns_hostnames = true

    tags = {
        "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    }

    public_subnet_tags = {
        "kubernetes.io/cluster/${local.cluster_name}" = "shared"
        "kubernetes.io/role/elb" = 1 
    }

    private_subnet_tags = {
        "kubernetes.io/cluster/${local.cluster_name}" = "shared"
        "kubernetes.io/role/internal-elb" = 1
    }

}
