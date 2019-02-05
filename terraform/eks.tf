module "demo-cluster" {
  source       = "terraform-aws-modules/eks/aws"
  cluster_name = "${var.project_name}-cluster"
  subnets      = ["${module.vpc.public_subnets}"]
  vpc_id       = "${module.vpc.vpc_id}"

  worker_groups = [
    {
      instance_type = "t2.small"
      asg_max_size  = 5
    },
  ]

  tags = {
    environment = "${var.project_name}-devel"
  }
}
