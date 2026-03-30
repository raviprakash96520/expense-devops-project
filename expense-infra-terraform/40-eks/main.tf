module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0" # EKS module version

  name               = "${var.project_name}-${var.environment}"
  kubernetes_version = "1.31"  # ✅ latest supported by AWS as of Nov 2025

  # --- Addons configuration ---
    addons = {
    coredns = {
      most_recent = true
      preserve    = true
      resolve_conflicts = "OVERWRITE"
    }

    kube-proxy = {
      most_recent = true
      preserve    = true
      resolve_conflicts = "OVERWRITE"
    }

    vpc-cni = {
      most_recent = true
      preserve    = true
      before_compute = true
      resolve_conflicts = "OVERWRITE"
    }

    eks-pod-identity-agent = {
      most_recent = true
      preserve    = true
      before_compute = true
      resolve_conflicts = "OVERWRITE"
    }

    metrics-server = {
      most_recent = true
      preserve    = true
      resolve_conflicts = "OVERWRITE"
    }
  }



  # --- Cluster access settings ---
  endpoint_public_access  = true
  endpoint_private_access = true

  enable_cluster_creator_admin_permissions = true

  # --- Networking ---
  vpc_id                   = data.aws_ssm_parameter.vpc_id.value
  subnet_ids               = local.private_subnet_ids
  control_plane_subnet_ids = local.private_subnet_ids

  create_node_security_group = false
  create_security_group      = false
  security_group_id          = local.eks_control_plane_sg_id
  node_security_group_id     = local.node_sg_id

  # --- Node Group(s) ---
  eks_managed_node_groups = {
    green = {
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t3.small"]   # ✅ free-tier eligible
      min_size       = 1
      max_size       = 6
      desired_size   = 6

      iam_role_additional_policies = {
        AmazonEBS      = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
        AmazonEFS      = "arn:aws:iam::aws:policy/service-role/AmazonEFSCSIDriverPolicy"
        AmazonEKSLoad  = "arn:aws:iam::aws:policy/AmazonEKSLoadBalancingPolicy"
      }
    }
  }

  tags = {
    Name = "${var.project_name}-${var.environment}"
  }
}
