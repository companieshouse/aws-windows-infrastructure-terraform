# ------------------------------------------------------------------------------
# Smart Vault 1 Server - ch-smartv1-12 Security Group and rules
# ------------------------------------------------------------------------------
module "smart_vault_1_server_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.0"

  name        = "sgr-${var.application}-smart_vault_1_server"
  description = "Security group for the ${var.application} Smart Vault 1 Server"
  vpc_id      = data.aws_vpc.vpc.id

  ingress_with_cidr_blocks = [
    {
      rule        = "http-80-tcp"
      cidr_blocks = join(",", local.smart_vault_1_http_cidr_block)
    },
    {
      from_port   = 135
      to_port     = 135
      protocol    = "tcp"
      cidr_blocks = join(",", local.smart_vault_1_135_cidr_block)
    },
    {
      from_port   = 445
      to_port     = 445
      protocol    = "tcp"
      cidr_blocks = join(",", local.smart_vault_1_445_cidr_block)
    },
    {
      from_port   = 1000
      to_port     = 1000
      protocol    = "tcp"
      cidr_blocks = "172.16.200.58/32"
    },
    {
      rule        = "rdp-tcp"
      cidr_blocks = join(",", local.smart_vault_1_rdp_cidr_block)
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
      rule        = "http-8080-tcp"
      cidr_blocks = join(",", local.smart_vault_1_8080_cidr_block)
    },
    {
      from_port   = 49155
      to_port     = 49155
      protocol    = "tcp"
      cidr_blocks = join(",", local.smart_vault_1_49155_cidr_block)
    },
    {
      from_port   = 55122
      to_port     = 55122
      protocol    = "tcp"
      cidr_blocks = "172.16.101.82/32"
    },
    {
      from_port   = 56589
      to_port     = 56589
      protocol    = "tcp"
      cidr_blocks = "172.16.101.82/32"
    },
    {
      from_port   = 135
      to_port     = 135
      protocol    = "tcp"
      description = "WMI Access"
      cidr_blocks = join(",", local.azure_dc_cidrs)
    },
    {
      from_port   = 49152
      to_port     = 65535
      protocol    = "tcp"
      description = "WMI Access"
      cidr_blocks = join(",", local.azure_dc_cidrs)
    },
    {
      from_port   = 6003
      to_port     = 6003
      protocol    = "tcp"
      description = "On-premise Access"
      cidr_blocks = join(",", local.smart_onprem_cidrs)
    }
  ]

  computed_ingress_with_source_security_group_id = [
    {
      from_port                = 6001
      to_port                  = 6001
      protocol                 = "tcp"
      source_security_group_id = module.smart_vault_1_server_security_group.this_security_group_id
    },
    {
      from_port                = 6001
      to_port                  = 6001
      protocol                 = "tcp"
      source_security_group_id = module.smart_vault_2_server_security_group.this_security_group_id
    },
    {
      from_port                = 6003
      to_port                  = 6003
      protocol                 = "tcp"
      source_security_group_id = module.smart_vault_1_server_security_group.this_security_group_id
    },
    {
      from_port                = 6003
      to_port                  = 6003
      protocol                 = "tcp"
      source_security_group_id = module.smart_vault_2_server_security_group.this_security_group_id
    },
    {
      from_port                = 8009
      to_port                  = 8009
      protocol                 = "tcp"
      source_security_group_id = module.smart_vault_1_server_security_group.this_security_group_id
    },
    {
      from_port                = 55121
      to_port                  = 55121
      protocol                 = "tcp"
      source_security_group_id = module.smart_vault_1_server_security_group.this_security_group_id
    }
  ]
  number_of_computed_ingress_with_source_security_group_id = 6

  egress_rules = ["all-all"]
}


# ------------------------------------------------------------------------------
# Smart Vault 2 Server - ch-smartv2-12 Security Group and rules
# ------------------------------------------------------------------------------
module "smart_vault_2_server_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.0"

  name        = "sgr-${var.application}-smart_vault_2_server"
  description = "Security group for the ${var.application} Smart Vault 2 Server"
  vpc_id      = data.aws_vpc.vpc.id

  ingress_with_cidr_blocks = [
    {
      from_port   = 135
      to_port     = 135
      protocol    = "tcp"
      cidr_blocks = join(",", local.smart_vault_2_135_cidr_block)
    },
    {
      from_port   = 445
      to_port     = 445
      protocol    = "tcp"
      cidr_blocks = join(",", local.smart_vault_2_445_cidr_block)
    },
    {
      from_port   = 1000
      to_port     = 1000
      protocol    = "tcp"
      cidr_blocks = "172.16.200.58/32"
    },
    {
      rule        = "rdp-tcp"
      cidr_blocks = join(",", local.smart_vault_2_rdp_cidr_block)
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
      from_port   = 49155
      to_port     = 49155
      protocol    = "tcp"
      cidr_blocks = join(",", local.smart_vault_2_49155_cidr_block)
    },
    {
      from_port   = 57059
      to_port     = 57059
      protocol    = "tcp"
      cidr_blocks = "172.16.101.82/32"
    },
    {
      from_port   = 59762
      to_port     = 59762
      protocol    = "tcp"
      cidr_blocks = "172.16.101.82/32"
    },
    {
      from_port   = 135
      to_port     = 135
      protocol    = "tcp"
      description = "WMI Access"
      cidr_blocks = join(",", local.azure_dc_cidrs)
    },
    {
      from_port   = 49152
      to_port     = 65535
      protocol    = "tcp"
      description = "WMI Access"
      cidr_blocks = join(",", local.azure_dc_cidrs)
    },
    {
      from_port   = 6003
      to_port     = 6003
      protocol    = "tcp"
      description = "On-premise Access"
      cidr_blocks = join(",", local.smart_onprem_cidrs)
    }
  ]

  computed_ingress_with_source_security_group_id = [
    {
      from_port                = 445
      to_port                  = 445
      protocol                 = "tcp"
      source_security_group_id = module.smart_vault_1_server_security_group.this_security_group_id
    },
    {
      from_port                = 6001
      to_port                  = 6001
      protocol                 = "tcp"
      source_security_group_id = module.smart_vault_1_server_security_group.this_security_group_id
    },
    {
      from_port                = 6001
      to_port                  = 6001
      protocol                 = "tcp"
      source_security_group_id = module.smart_vault_2_server_security_group.this_security_group_id
    },
    {
      from_port                = 8009
      to_port                  = 8009
      protocol                 = "tcp"
      source_security_group_id = module.smart_vault_1_server_security_group.this_security_group_id
    }
  ]
  number_of_computed_ingress_with_source_security_group_id = 4

  egress_rules = ["all-all"]
}
