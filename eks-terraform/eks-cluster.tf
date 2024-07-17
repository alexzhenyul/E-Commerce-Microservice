module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.17.2"
  cluster_name    = local.cluster_name
  cluster_version = var.kubernetes_version
  subnet_ids      = module.vpc.private_subnets
  cluster_endpoint_public_access  = true
  enable_cluster_creator_admin_permissions = true

  enable_irsa = true

  tags = {
    cluster = "${var.project_name}"
  }

  vpc_id = module.vpc.vpc_id

  eks_managed_node_group_defaults = {
    ami_type               = var.ami_type
    instance_types         = var.instance_types
    vpc_security_group_ids = [aws_security_group.worker_sg.id]
  }

  eks_managed_node_groups = {

    node_group = {
      min_size     = 2
      max_size     = 3
      desired_size = 2
    }
  }
}

