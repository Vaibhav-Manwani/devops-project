module "vpc" {
  source = "/Users/vaibhavmanwani/Documents/devops-project/terraform/modules/vpc"

  vpc_cidr            = "10.0.0.0/16"
  avail_zone          = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnet_cidr = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnet_cidr  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  cluster_name        = "my-eks-cluster"
}

module "eks" {
  source = "/Users/vaibhavmanwani/Documents/devops-project/terraform/modules/eks"

  cluster_name    = "my-eks-cluster"
  k8s-version     = "1.32"
  subnet_ids      = module.vpc.private_subnet_ids
  node_group_name = "my-eks-node-group"
  instance_type   = ["t3.medium"]

}