# ------------------------------------------------------------------------------
# Remittance Processor (Rempro) Server - CH-CHECKPRT-12 Security Group and rules
# ------------------------------------------------------------------------------
module "rempro_server_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.0"

  name        = "sgr-${var.application}-rempro_server"
  description = "Security group for the ${var.application} Rempro Server"
  vpc_id      = data.aws_vpc.vpc.id

  ingress_with_cidr_blocks = [
    {
      rule        = "http-80-tcp"
      cidr_blocks = join(",", local.rempro_http_cidr_block)
    },
    {
      from_port   = 135
      to_port     = 135
      protocol    = "tcp"
      cidr_blocks = join(",", local.rempro_135_cidr_block)
    },
    {
      from_port   = 445
      to_port     = 445
      protocol    = "tcp"
      cidr_blocks = join(",", local.rempro_445_cidr_block)
    },
    {
      from_port   = 139
      to_port     = 139
      protocol    = "tcp"
      cidr_blocks = join(",", local.rempro_139_cidr_block)
    },
    {
      from_port   = 1000
      to_port     = 1000
      protocol    = "tcp"
      cidr_blocks = "172.16.200.58/32"
    },
    {
      from_port   = 6129
      to_port     = 6129
      protocol    = "tcp"
      cidr_blocks = "10.172.20.0/22"
    },
    {
      from_port   = 49155
      to_port     = 49155
      protocol    = "tcp"
      cidr_blocks = join(",", local.rempro_49155_cidr_block)
    },
    {
      from_port   = 49234
      to_port     = 49234
      protocol    = "tcp"
      cidr_blocks = "172.16.101.82/32"
    },
    {
      from_port   = 59638
      to_port     = 59638
      protocol    = "tcp"
      cidr_blocks = join(",", local.rempro_59638_cidr_block)
    },
    {
      from_port   = 62984
      to_port     = 62984
      protocol    = "tcp"
      cidr_blocks = "172.16.101.82/32"
    },
    {
      from_port   = 49152
      to_port     = 65535
      protocol    = "tcp"
      cidr_blocks = "172.19.0.0/17"
    }
  ]

  egress_rules = ["all-all"]
}