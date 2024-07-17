cluster_name       = "E-commerce-eks-cluster"
instance_count     = 2
instance_size      = "t3.medium"
region             = "ap-southeast-4"
cluster_version    = "1.29"
ami_id             = "ami-09871461b40a093ff"
vpc-cni-version    = "v1.18.0-eksbuild.1"
kube-proxy-version = "v1.28.6-eksbuild.2"
