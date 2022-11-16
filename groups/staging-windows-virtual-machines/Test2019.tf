# ------------------------------------------------------------------------------
# Test 2019 server 1 Security Group and rules
# ------------------------------------------------------------------------------
module "test_2019_1_ec2_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.0"

  name        = "sgr-${var.application}-test-2019-1-server"
  description = "Security group for the ${var.application} Test 2019 Server 1"
  vpc_id      = data.aws_vpc.vpc.id

  ingress_with_cidr_blocks = [
    {
      from_port   = 135
      to_port     = 135
      protocol    = "tcp"
      cidr_blocks = join(",", local.test_2019_1_135_cidr_block)
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
      cidr_blocks = join(",", local.test_2019_1_rdp_cidr_block)
    },
    {
      rule        = "winrm-http-tcp"
      cidr_blocks = "172.16.200.200/32"
    },
    {
      from_port   = 49155
      to_port     = 49155
      protocol    = "tcp"
      cidr_blocks = join(",", local.test_2019_1_49155_cidr_block)
    },
    {
      from_port   = 49377
      to_port     = 49377
      protocol    = "tcp"
      cidr_blocks = "172.16.101.82/32"
    },
    {
      from_port   = 58543
      to_port     = 58543
      protocol    = "tcp"
      cidr_blocks = "172.16.200.26/32"
    },
    {
      from_port   = 58577
      to_port     = 58577
      protocol    = "tcp"
      cidr_blocks = "172.16.101.82/32"
    },
    {
      rule        = "http-8080-tcp"
      cidr_blocks = join(",", local.test_2019_1_8080_cidr_block)
    },
    {
      from_port   = 6400
      to_port     = 6414
      protocol    = "tcp"
      cidr_blocks = join(",", local.test_2019_1_6400_6414_cidr_block)
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

  egress_rules = ["all-all"]
}


# ------------------------------------------------------------------------------
# Test 2019 Server 1 CloudWatch
# ------------------------------------------------------------------------------

resource "aws_cloudwatch_log_group" "test_2019_1" {
  for_each = local.test_2019_1_cw_logs

  name              = each.value["log_group_name"]
  retention_in_days = lookup(each.value, "log_group_retention", var.default_log_group_retention_in_days)
  kms_key_id        = lookup(each.value, "kms_key_id", data.aws_kms_key.logs.arn)

  tags = merge(
    local.default_tags,
    map(
      "Name", "${var.application}-test-2019-1-server",
      "ServiceTeam", var.ServiceTeam
    )
  )
}

# ------------------------------------------------------------------------------
# Test 2019 Server 1 EC2
# ------------------------------------------------------------------------------

module "test_2019_1_ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.19.0"

  name = var.test_2019_1_ec2_name

  ami                    = var.test_2019_1_ami
  instance_type          = var.test_2019_1_ec2_instance_size
  key_name               = aws_key_pair.test_2019_1_keypair.key_name
  monitoring             = var.monitoring
  get_password_data      = var.get_password_data
  vpc_security_group_ids = [module.test_2019_1_ec2_security_group.this_security_group_id, data.aws_security_group.rdp_shared.id]
  subnet_id              = coalesce(data.aws_subnet_ids.application.ids...)
  iam_instance_profile   = module.test_2019_1_profile.aws_iam_instance_profile.name
  ebs_optimized          = var.ebs_optimized

  root_block_device = [
    {
      delete_on_termination = var.delete_on_termination
      volume_size           = "100"
      volume_type           = var.volume_type
      encrypted             = var.ebs_encrypted
      kms_key_id            = data.aws_kms_key.ebs.arn
    }
  ]

  ebs_block_device = [
    {
      delete_on_termination = var.delete_on_termination
      device_name           = "/dev/xvdf"
      encrypted             = var.ebs_encrypted
      volume_size           = "100"
      volume_type           = var.volume_type
      kms_key_id            = data.aws_kms_key.ebs.arn
    }
  ]

  tags = merge(
    local.default_tags,
    map(
      "Name", var.test_2019_1_ec2_name,
      "Application", var.test_2019_1_application,
      "ServiceTeam", var.ServiceTeam,
      "Backup", "backup14",
      "BackupApp", var.application,
      "scheduled_stop", var.scheduled_stop
    )
  )

  volume_tags = merge(
    local.default_tags,
    map(
      "Name", var.test_2019_1_ec2_name,
      "Application", var.test_2019_1_application,
      "ServiceTeam", var.ServiceTeam,
      "Backup", "backup14",
      "BackupApp", var.application,
      "scheduled_stop", var.scheduled_stop
    )
  )
}
