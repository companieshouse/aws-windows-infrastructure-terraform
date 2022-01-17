# ------------------------------------------------------------------------------
# ABBYY Document Capture & OCR Security Group and rules
# ------------------------------------------------------------------------------
module "abbyy_doc_ocr_ec2_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.0"

  name        = "sgr-${var.application}-abbyy-doc-ocr-server"
  description = "Security group for the ${var.application} ABBYY Document Capture & OCR Server"
  vpc_id      = data.aws_vpc.vpc.id

  ingress_with_cidr_blocks = [
    {
      from_port   = 135
      to_port     = 135
      protocol    = "tcp"
      cidr_blocks = join(",", local.abbyy_doc_ocr_135_cidr_block)
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
      rule        = "rdp-tcp"
      cidr_blocks = join(",", local.abbyy_doc_ocr_rdp_cidr_block)
    },
    {
      rule        = "winrm-http-tcp"
      cidr_blocks = "172.16.155.9/32"
    },
    {
      from_port   = 6129
      to_port     = 6129
      protocol    = "tcp"
      cidr_blocks = "10.172.0.0/17"
    },
    {
      from_port   = 49155
      to_port     = 49155
      protocol    = "tcp"
      cidr_blocks = join(",", local.abbyy_doc_ocr_49155_cidr_block)
    },
    {
      from_port   = 53853
      to_port     = 53853
      protocol    = "tcp"
      cidr_blocks = "172.16.101.82/32"
    },
    {
      from_port   = 49227
      to_port     = 49227
      protocol    = "tcp"
      cidr_blocks = "172.16.101.82/32"
    },
    #{
    #rule        = "rdp-tcp"
    #cidr_blocks = join(",", local.abbyy_doc_ocr_third_party_rdp_cidr_block)
    #}
  ]

  ingress_with_self = [
    {
      rule                     = "http-80-tcp"
      source_security_group_id = module.abbyy_doc_ocr_ec2_security_group.this_security_group_id
    },
    {
      from_port                = 10020
      to_port                  = 10020
      protocol                 = "tcp"
      source_security_group_id = module.abbyy_doc_ocr_ec2_security_group.this_security_group_id
    },
    {
      rule                     = "http-80-tcp"
      source_security_group_id = module.abbyy_doc_ocr_internal_alb_security_group.this_security_group_id
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
    map(
      "Name", "${var.application}-abbyy-doc-ocr-server",
      "ServiceTeam", var.ServiceTeam
    )
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
  subnet_id              = sort(data.aws_subnet_ids.application.ids)[count.index]
  vpc_security_group_ids = [module.abbyy_doc_ocr_ec2_security_group.this_security_group_id, data.aws_security_group.rdp_shared.id]
  iam_instance_profile   = module.abbyy_doc_ocr_profile.aws_iam_instance_profile.name
  ebs_optimized          = var.ebs_optimized

  root_block_device {
    delete_on_termination = var.delete_on_termination
    volume_size           = "100"
    volume_type           = var.volume_type
    encrypted             = var.ebs_encrypted
    kms_key_id            = data.aws_kms_key.ebs.arn
  }

  ebs_block_device {
    delete_on_termination = var.delete_on_termination
    device_name           = "/dev/xvdf"
    encrypted             = var.ebs_encrypted
    volume_size           = "230"
    volume_type           = var.volume_type
    kms_key_id            = data.aws_kms_key.ebs.arn
  }

  tags = merge(
    local.default_tags,
    map(
      "Name", "{var.abbyy_doc_ocr_ec2_name}${count.index + 1}-2k19",
      "Application", var.abbyy_doc_ocr_application,
      "ServiceTeam", var.ServiceTeam,
      "Backup", "true",
      "BackupApp", var.application
    )
  )

  volume_tags = merge(
    local.default_tags,
    map(
      "Name", "{var.abbyy_doc_ocr_ec2_name}${count.index + 1}-2k19",
      "Application", var.abbyy_doc_ocr_application,
      "ServiceTeam", var.ServiceTeam,
      "Backup", "true",
      "BackupApp", var.application
    )
  )
}

resource "aws_lb_target_group_attachment" "ec2_alb_assoc" {
  count            = var.abbyy_doc_ocr_ec2_count
  target_group_arn = module.abbyy_doc_ocr_internal_alb.target_group_arns[0]
  target_id        = aws_instance.abbyy_doc_ocr_ec2[count.index].id
  port             = var.fe_service_port

  depends_on = [
    module.abbyy_doc_ocr_internal_alb
  ]
}