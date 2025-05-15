output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value = module.eks.cluster_endpoint
}

output "cluster-name" {
  description = "EKS cluster name"
  value = module.eks.cluster_name
}

output "vpc_id" {
  description = "VPC id for cluster"
  value = module.vpc.vpc_id
}