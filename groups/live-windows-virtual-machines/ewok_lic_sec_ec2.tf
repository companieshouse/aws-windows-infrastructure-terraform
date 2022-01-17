# ------------------------------------------------------------------------------
# Ewok License Second Security Group and rules
# ------------------------------------------------------------------------------
module "ewok_lic_sec_ec2_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.0"

  name        = "sgr-${var.application}-ewok-lic-second-server"
  description = "Security group for the ${var.application} Ewok License Second Server"
  vpc_id      = data.aws_vpc.vpc.id

  ingress_with_cidr_blocks = [
    {
      from_port   = 135
      to_port     = 135
      protocol    = "tcp"
      cidr_blocks = join(",", local.ewok_lic_sec_135_cidr_block)
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
      rule        = "winrm-http-tcp"
      cidr_blocks = "172.16.200.200/32"
    },
    {
      from_port   = 10040
      to_port     = 10040
      protocol    = "tcp"
      cidr_blocks = "172.16.200.11/32"
    },
    {
      from_port   = 49155
      to_port     = 49155
      protocol    = "tcp"
      cidr_blocks = join(",", local.ewok_lic_sec_49155_cidr_block)
    },
    {
      from_port   = 53838
      to_port     = 53838
      protocol    = "tcp"
      cidr_blocks = "172.16.101.82/32"
    },
    {
      from_port   = 57834
      to_port     = 57834
      protocol    = "tcp"
      cidr_blocks = "172.16.101.82/32"
    },
    #{
    #rule        = "rdp-tcp"
    #cidr_blocks = join(",", local.ewok_lic_sec_third_party_rdp_cidr_block)
    #}
  ]

  egress_rules = ["all-all"]
}

# ------------------------------------------------------------------------------
# Ewok License Second CloudWatch
# ------------------------------------------------------------------------------

resource "aws_cloudwatch_log_group" "ewok_lic_sec" {
  for_each = local.ewok_lic_sec_cw_logs

  name              = each.value["log_group_name"]
  retention_in_days = lookup(each.value, "log_group_retention", var.default_log_group_retention_in_days)
  kms_key_id        = lookup(each.value, "kms_key_id", data.aws_kms_key.logs.arn)

  tags = merge(
    local.default_tags,
    map(
      "Name", "${var.application}-ewok-lic-second-server",
      "ServiceTeam", var.ServiceTeam
    )
  )
}

# ------------------------------------------------------------------------------
# Ewok License Second EC2
# ------------------------------------------------------------------------------

module "ewok_lic_sec_ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.19.0"

  name = var.ewok_lic_sec_ec2_name

  ami                    = var.ewok_lic_sec_ami
  instance_type          = var.ewok_lic_sec_ec2_instance_size
  key_name               = aws_key_pair.ewok_lic_keypair.key_name
  monitoring             = var.monitoring
  get_password_data      = var.get_password_data
  vpc_security_group_ids = [module.ewok_lic_sec_ec2_security_group.this_security_group_id, data.aws_security_group.rdp_shared.id]
  subnet_id              = coalesce(data.aws_subnet_ids.application.ids...)
  iam_instance_profile   = module.ewok_lic_sec_profile.aws_iam_instance_profile.name
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
      volume_size           = "40"
      volume_type           = var.volume_type
      kms_key_id            = data.aws_kms_key.ebs.arn
    }
  ]

  tags = merge(
    local.default_tags,
    map(
      "Name", var.ewok_lic_sec_ec2_name,
      "Application", var.ewok_lic_sec_application,
      "ServiceTeam", var.ServiceTeam,
      "Backup", "true",
      "BackupApp", var.application
    )
  )

  volume_tags = merge(
    local.default_tags,
    map(
      "Name", var.ewok_lic_sec_ec2_name,
      "Application", var.ewok_lic_sec_application,
      "ServiceTeam", var.ServiceTeam,
      "Backup", "true",
      "BackupApp", var.application
    )
  )
}
