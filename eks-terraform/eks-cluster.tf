module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.17.2"
  cluster_name    = local.cluster_name
  cluster_version = var.kubernetes_version
  subnet_ids      = module.vpc.private_subnets
  role_arn        = aws_iam_role.devops_iam_role.arn
  node_role_arn   = aws_iam_role.node_iam_role.arn

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
    
    depends_on = [
    aws_iam_role_policy_attachment.EKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.EKS_CNI_Policy,
    aws_iam_role_policy_attachment.EC2ContainerRegistryReadOnly,
    ]  
  }
}

