variable "cluster_name" {
  description = "EKS cluster name"
  type = string
}
variable "k8s-version" {
    description = "Kubernetes version"
    type = string
}
variable "subnet_ids" {
  description = "Private subnets cidrs for EKS"
  type = list(string)
}
variable "node_group_name" {
  description = "Node group name"
  type = string
}
variable "instance_type" {
  description = "Type of instance for worker nodes"
  type = list(string)
}
