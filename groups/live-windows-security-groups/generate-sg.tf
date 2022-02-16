# ------------------------------------------------------------------------------
# Test/Dev Generate Server - ch-doc1tdg-12 Security Group and rules
# ------------------------------------------------------------------------------
module "test_dev_generate_server_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.0"

  name        = "sgr-${var.application}-test_dev_generate_server"
  description = "Security group for the ${var.application} Test/Dev Generate Server"
  vpc_id      = data.aws_vpc.vpc.id

  ingress_with_cidr_blocks = [
    {
      rule        = "winrm-http-tcp"
      cidr_blocks = "172.16.200.200/32"
    },
    {
      rule        = "rdp-tcp"
      cidr_blocks = join(",", local.test_dev_generate_rdp_cidr_block)
    },
    {
      from_port   = 1000
      to_port     = 1000
      protocol    = "tcp"
      cidr_blocks = "172.16.200.58/32"
    },
    {
      from_port   = 49155
      to_port     = 49155
      protocol    = "tcp"
      cidr_blocks = join(",", local.test_dev_generate_49155_cidr_block)
    },
    {
      from_port   = 135
      to_port     = 135
      protocol    = "tcp"
      cidr_blocks = join(",", local.test_dev_generate_135_cidr_block)
    },
    {
      from_port   = 49643
      to_port     = 49643
      protocol    = "tcp"
      cidr_blocks = "172.16.101.82/32"
    },
    {
      from_port   = 59510
      to_port     = 59510
      protocol    = "tcp"
      cidr_blocks = "172.16.101.82/32"
    },
    {
      from_port   = 64149
      to_port     = 64149
      protocol    = "tcp"
      cidr_blocks = "172.16.101.82/32"
    },
    {
      from_port   = 6129
      to_port     = 6129
      protocol    = "tcp"
      cidr_blocks = "10.172.120.162/32"
    },
    {
      rule        = "http-8080-tcp"
      cidr_blocks = "10.172.116.0/22"
    }
  ]

  egress_rules = ["all-all"]
}

# ------------------------------------------------------------------------------
# Production Generate Server - ch-doc1pg-12 Security Group and rules
# ------------------------------------------------------------------------------
module "prod_generate_server_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.0"

  name        = "sgr-${var.application}-prod_generate_server"
  description = "Security group for the ${var.application} Production Generate Server"
  vpc_id      = data.aws_vpc.vpc.id

  ingress_with_cidr_blocks = [
    {
      rule        = "winrm-http-tcp"
      cidr_blocks = "172.16.200.200/32"
    },
    {
      rule        = "rdp-tcp"
      cidr_blocks = join(",", local.prod_generate_rdp_cidr_block)
    },
    {
      from_port   = 1000
      to_port     = 1000
      protocol    = "tcp"
      cidr_blocks = "172.16.200.58/32"
    },
    {
      from_port   = 49155
      to_port     = 49155
      protocol    = "tcp"
      cidr_blocks = join(",", local.prod_generate_49155_cidr_block)
    },
    {
      from_port   = 135
      to_port     = 135
      protocol    = "tcp"
      cidr_blocks = join(",", local.prod_generate_135_cidr_block)
    },
    {
      from_port   = 445
      to_port     = 445
      protocol    = "tcp"
      cidr_blocks = "172.16.101.82/32"
    },
    {
      from_port   = 49637
      to_port     = 49637
      protocol    = "tcp"
      cidr_blocks = "172.16.101.82/32"
    },
    {
      from_port   = 49267
      to_port     = 49267
      protocol    = "tcp"
      cidr_blocks = "172.16.101.82/32"
    },
    {
      from_port   = 54312
      to_port     = 54312
      protocol    = "tcp"
      cidr_blocks = "172.16.101.82/32"
    },
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = "172.19.49.17/32"
    },
    {
      from_port   = 6129
      to_port     = 6129
      protocol    = "tcp"
      cidr_blocks = "10.172.120.162/32"
    }
  ]

  egress_rules = ["all-all"]
}