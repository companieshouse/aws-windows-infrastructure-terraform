# ------------------------------------------------------------------------------
# Chips Estor Application Server- ch-estor1-16 - Security Group and rules
# ------------------------------------------------------------------------------
module "chips_estor_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.0"

  name        = "sgr-${var.application}-chips-estor-security-group"
  description = "Security group for the ${var.application} Chips-Estor-Security-Group"
  vpc_id      = data.aws_vpc.vpc.id

  ingress_with_cidr_blocks = [
    {
      from_port   = 135
      to_port     = 135
      protocol    = "tcp"
      cidr_blocks = join(",", local.chips_135_cidr_block)
    },
    {
      from_port   = 445
      to_port     = 445
      protocol    = "tcp"
      cidr_blocks = join(",", local.chips_445_cidr_block)
    },
    {
      rule        = "http-8080-tcp"
      cidr_blocks = join(",", local.chips_8080_cidr_block)
    },
    {
      from_port   = 1000
      to_port     = 1000
      protocol    = "tcp"
      cidr_blocks = "172.16.200.58/32"
    },
    {
      rule        = "winrm-http-tcp"
      cidr_blocks = "172.16.200.200/32"
    },
    {
      from_port   = 6129
      to_port     = 6129
      protocol    = "tcp"
      cidr_blocks = "10.172.120.161/32"
    },
    {
      from_port   = 49665
      to_port     = 49665
      protocol    = "tcp"
      cidr_blocks = "10.172.20.153/32"
    },
    {
      from_port   = 53971
      to_port     = 53971
      protocol    = "tcp"
      cidr_blocks = join(",", local.chips_53971_cidr_block)
    },
    {
      from_port   = 54007
      to_port     = 54007
      protocol    = "tcp"
      cidr_blocks = "172.16.101.82/32"
    },
    {
      from_port   = 55792
      to_port     = 55792
      protocol    = "tcp"
      cidr_blocks = join(",", local.chips_55792_cidr_block)
    },
    {
      from_port   = 57745
      to_port     = 57745
      protocol    = "tcp"
      cidr_blocks = "172.16.202.91/32"
    },
    {
      from_port   = 57842
      to_port     = 57842
      protocol    = "tcp"
      cidr_blocks = "10.172.20.153/32"
    }
  ]

  computed_ingress_with_source_security_group_id = [
    {
      rule        = "http-8080-tcp"
      source_security_group_id = module.chips_estor_security_group.this_security_group_id
    }
  ]
  number_of_computed_ingress_with_source_security_group_id = 1

  egress_rules = ["all-all"]
}