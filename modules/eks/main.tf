# modules/eks/main.tf

module "eks" {
  source            = "terraform-aws-modules/eks/aws"
  cluster_name      = var.cluster_name
  cluster_version   = var.cluster_version
  subnet_ids        = var.subnet_ids
  vpc_id            = var.vpc_id
  tags              = var.tags

  eks_managed_node_groups = {
    dev = {
      desired_size = 2
      max_size     = 3
      min_size     = 1

      instance_types = ["t3.medium"]
    }
  }
}
