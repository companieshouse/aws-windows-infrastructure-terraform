# ------------------------------------------------------------------------------
# Designer Application Server - ch-doc1da-12 - Security Group and rules
# ------------------------------------------------------------------------------
module "designer_server_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.0"

  name        = "sgr-${var.application}-designer_server"
  description = "Security group for the ${var.application} Designer Application Server"
  vpc_id      = data.aws_vpc.vpc.id

  ingress_with_cidr_blocks = [
    {
      rule        = "http-80-tcp"
      cidr_blocks = "172.16.200.200/32"
    },
    {
      from_port   = 135
      to_port     = 135
      protocol    = "tcp"
      cidr_blocks = join(",", local.designer_135_cidr_block)
    },
    {
      from_port   = 445
      to_port     = 445
      protocol    = "tcp"
      cidr_blocks = "172.16.101.82/32"
    },
    {
      from_port   = 1000
      to_port     = 1000
      protocol    = "tcp"
      cidr_blocks = "172.16.200.58/32"
    },
    {
      rule        = "mssql-tcp"
      cidr_blocks = join(",", local.designer_mssql_cidr_block)
    },
    {
      rule        = "rdp-tcp"
      cidr_blocks = join(",", local.designer_rdp_cidr_block)
    },
    {
      rule        = "winrm-http-tcp"
      cidr_blocks = "172.16.200.200/32"
    },
    {
      from_port   = 6129
      to_port     = 6129
      protocol    = "tcp"
      cidr_blocks = "10.172.120.162/32"
    },
    {
      from_port   = 37719
      to_port     = 37719
      protocol    = "tcp"
      cidr_blocks = join(",", local.designer_37719_cidr_block)
    },
    {
      from_port   = 49155
      to_port     = 49155
      protocol    = "tcp"
      cidr_blocks = join(",", local.designer_49155_cidr_block)
    },
    {
      from_port   = 52554
      to_port     = 52554
      protocol    = "tcp"
      cidr_blocks = "172.16.101.82/32"
    },
    {
      from_port   = 59518
      to_port     = 59518
      protocol    = "tcp"
      cidr_blocks = "172.16.101.82/32"
    },
    {
      from_port   = 64865
      to_port     = 64865
      protocol    = "tcp"
      cidr_blocks = "172.16.101.82/32"
    }
  ]

  computed_ingress_with_source_security_group_id = [
    {
      from_port                = 445
      to_port                  = 445
      protocol                 = "tcp"
      source_security_group_id = module.designer_server_security_group.this_security_group_id
    }
  ]
  number_of_computed_ingress_with_source_security_group_id = 1

  egress_rules = ["all-all"]
}