variable "region" {
  default = "ap-northeast-1"
}

variable "cluster_name" {
	default = "eks-fargate-cluster"
}

variable "vpc_name" {
	default = "eks-fargate-vpc"
}

variable "fargate_profile_name" {
	default = "default"
}

locals {
  eks_fargate_iam_role_name = "${var.cluster_name}-eks-fargate-iam-role"
}
