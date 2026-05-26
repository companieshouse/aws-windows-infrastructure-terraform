# ------------------------------------------------------------------------------
# ABBYY Document Capture & OCR Security Group and rules
# ------------------------------------------------------------------------------
module "abbyy_doc_ocr_ec2_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.1"

  name        = "sgr-${var.application}-abbyy-doc-ocr-server"
  description = "Security group for the ${var.application} ABBYY Document Capture & OCR Server"
  vpc_id      = data.aws_vpc.vpc.id
  use_name_prefix = true
  egress_ipv6_cidr_blocks = []
  ingress_ipv6_cidr_blocks = []

  ingress_with_cidr_blocks = [
    {
      from_port   = 135
      to_port     = 135
      protocol    = "tcp"
      cidr_blocks = join(",", local.ingress_cidr_blocks_abby_doc_ocr["135_cidr_block"])
    },
    {
      from_port   = 445
      to_port     = 445
      protocol    = "tcp"
      cidr_blocks = join(",", local.ingress_cidr_blocks_abby_doc_ocr["445_cidr_block"])
    },
    {
      from_port   = 1000
      to_port     = 1000
      protocol    = "tcp"
      cidr_blocks = join(",", local.ingress_cidr_blocks_abby_doc_ocr["1000_cidr_block"])
    },
    {
      rule        = "rdp-tcp"
      cidr_blocks = join(",", local.ingress_cidr_blocks_abby_doc_ocr["rdp_cidr_block"])
    },
    {
      rule        = "winrm-http-tcp"
      cidr_blocks = join(",", local.ingress_cidr_blocks_abby_doc_ocr["winrm_http_tcp"])
    },
    {
      from_port   = 6129
      to_port     = 6129
      protocol    = "tcp"
      cidr_blocks = join(",", local.ingress_cidr_blocks_abby_doc_ocr["6129_cidr_block"])
    },
    {
      from_port   = 49155
      to_port     = 49155
      protocol    = "tcp"
      cidr_blocks = join(",", local.ingress_cidr_blocks_abby_doc_ocr["49155_cidr_block"])
    },
    {
      from_port   = 53853
      to_port     = 53853
      protocol    = "tcp"
      cidr_blocks = join(",", local.ingress_cidr_blocks_abby_doc_ocr["53853_cidr_block"])
    },
    {
      from_port   = 49227
      to_port     = 49227
      protocol    = "tcp"
      cidr_blocks = join(",", local.ingress_cidr_blocks_abby_doc_ocr["49227_cidr_block"])
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
    }
  ]

  ingress_with_self = [
    {
      rule = "http-80-tcp"
      self = true
    },
    {
      from_port   = 10020
      to_port     = 10020
      protocol    = "tcp"
      description = "FlexiCapture Service"
      self        = true
    }
  ]

  egress_rules = ["all-all"]
}

# ------------------------------------------------------------------------------
# ABBYY Document Capture & OCR CloudWatch
# ------------------------------------------------------------------------------

resource "aws_cloudwatch_log_group" "abbyy_doc_ocr" {
  for_each = local.abbyy_doc_ocr_cw_logs

  name              = each.value["log_group_name"]
  retention_in_days = lookup(each.value, "log_group_retention", var.default_log_group_retention_in_days)
  kms_key_id        = lookup(each.value, "kms_key_id", data.aws_kms_key.logs.arn)

  tags = merge(
    local.default_tags,
    {
      Name         = "${var.application}-abbyy-doc-ocr-server"
      ServiceTeam  = var.ServiceTeam
    }
  )
}

# ------------------------------------------------------------------------------
# ABBYY Document Capture & OCR EC2
# ------------------------------------------------------------------------------

resource "aws_instance" "abbyy_doc_ocr_ec2" {
  count                  = var.abbyy_doc_ocr_ec2_count
  ami                    = var.abbyy_doc_ocr_ami
  key_name               = aws_key_pair.abbyy_doc_ocr_keypair.key_name
  instance_type          = var.abbyy_doc_ocr_ec2_instance_size
  monitoring             = var.monitoring
  get_password_data      = var.get_password_data
  subnet_id              = sort(data.aws_subnets.application.ids)[count.index]
  vpc_security_group_ids = [module.abbyy_doc_ocr_ec2_security_group.security_group_id, data.aws_security_group.rdp_shared.id]
  iam_instance_profile   = module.abbyy_doc_ocr_profile.aws_iam_instance_profile.name
  ebs_optimized          = var.ebs_optimized

  root_block_device {
    delete_on_termination = var.delete_on_termination
    volume_size           = 150
    volume_type           = var.volume_type
    encrypted             = var.ebs_encrypted
    kms_key_id            = data.aws_kms_key.ebs.arn
  }

  ebs_block_device {
    delete_on_termination = var.delete_on_termination
    device_name           = "/dev/xvdf"
    encrypted             = var.ebs_encrypted
    volume_size           = 230
    volume_type           = var.volume_type
    kms_key_id            = data.aws_kms_key.ebs.arn
  }

  tags = merge(
    local.default_tags,
    {
      Name           = "${var.abbyy_doc_ocr_ec2_name}${count.index + 1}-app"
      Application    = var.abbyy_doc_ocr_application
      ServiceTeam    = var.ServiceTeam
      Backup         = "backup21"
      BackupApp      = var.application
    }
  )

  volume_tags = merge(
    local.default_tags,
    {
      Name           = "${var.abbyy_doc_ocr_ec2_name}${count.index + 1}-app"
      Application    = var.abbyy_doc_ocr_application
      ServiceTeam    = var.ServiceTeam
      Backup         = "backup21"
      BackupApp      = var.application
    }
  )
}
