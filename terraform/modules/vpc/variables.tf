variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type = string
}
variable "public_subnet_cidr" {
  description = "CIDR block for public subnets"
  type = list(string)
}
variable "private_subnet_cidr" {
  description = "CIDR block for private subnets"
  type = list(string)
}
variable "avail_zone" {
    description = "Availability zones for subnets"
    type = list(string)
}
variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}