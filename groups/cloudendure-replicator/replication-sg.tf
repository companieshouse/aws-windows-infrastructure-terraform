# ------------------------------------------------------------------------------
# CloudEndure Replicator Security Group and rules
# ------------------------------------------------------------------------------
module "cloudendure_replicator_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.0"

  name        = "sgr-${var.application}-cloudendure-replicator"
  description = "Security group for the ${var.application} CloudEndure Replicator"
  vpc_id      = data.aws_vpc.vpc.id

  ingress_with_cidr_blocks = [
    {
      from_port   = 1500
      to_port     = 1500
      protocol    = "tcp"
      description = "vCenter VM source CloudEndure Replicator"
      cidr_blocks = join(",", var.vcenter_cidr_block)
    }
  ]

  egress_rules = ["all-all"]
}
