cluster_name       = "E-commerce-eks-cluster"
instance_count     = 2
instance_size      = "t3.medium"
region             = "ap-southeast-4"
cluster_version    = "1.29"
ami_id             = "ami-0000cd26924f513ba"
vpc-cni-version    = "latest"
kube-proxy-version = "latest"