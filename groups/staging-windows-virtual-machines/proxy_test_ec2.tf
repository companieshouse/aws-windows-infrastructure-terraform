# ------------------------------------------------------------------------------
# Proxy Test Security Group and rules
# ------------------------------------------------------------------------------
module "proxy_test_ec2_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.0"

  name        = "sgr-${var.application}-proxy-test-server"
  description = "Security group for the ${var.application} Proxy Test Server"
  vpc_id      = data.aws_vpc.vpc.id

  egress_rules = ["all-all"]
}
# ------------------------------------------------------------------------------
# Proxy Test CloudWatch
# ------------------------------------------------------------------------------

resource "aws_cloudwatch_log_group" "proxy_test" {
  for_each = local.proxy_test_cw_logs

  name              = each.value["log_group_name"]
  retention_in_days = lookup(each.value, "log_group_retention", var.default_log_group_retention_in_days)
  kms_key_id        = lookup(each.value, "kms_key_id", data.aws_kms_key.logs.arn)

  tags = merge(
    local.default_tags,
    map(
      "Name", "${var.application}-proxy-test-server",
      "ServiceTeam", var.ServiceTeam
    )
  )
}

# ------------------------------------------------------------------------------
# proxy test EC2
# ------------------------------------------------------------------------------

module "proxy_test_ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.19.0"

  name = var.proxy_test_ec2_name

  ami                    = var.proxy_test_ami
  instance_type          = var.proxy_test_ec2_instance_size
  key_name               = aws_key_pair.doc_sim_keypair.key_name
  monitoring             = var.monitoring
  get_password_data      = var.get_password_data
  vpc_security_group_ids = [module.proxy_test_ec2_security_group.this_security_group_id, data.aws_security_group.rdp_shared.id]
  subnet_id              = coalesce(data.aws_subnet_ids.application.ids...)
  iam_instance_profile   = module.proxy_test_profile.aws_iam_instance_profile.name
  ebs_optimized          = var.ebs_optimized

  root_block_device = [
    {
      delete_on_termination = var.delete_on_termination
      volume_size           = "50"
      volume_type           = var.volume_type
      encrypted             = var.ebs_encrypted
      kms_key_id            = data.aws_kms_key.ebs.arn
    }
  ]

  tags = merge(
    local.default_tags,
    map(
      "Name", var.proxy_test_ec2_name,
      "Application", var.proxy_test_application,
      "ServiceTeam", var.ServiceTeam,
      "Backup", "true",
      "BackupApp", var.application
    )
  )

  volume_tags = merge(
    local.default_tags,
    map(
      "Name", var.proxy_test_ec2_name,
      "Application", var.proxy_test_application,
      "ServiceTeam", var.ServiceTeam,
      "Backup", "true",
      "BackupApp", var.application
    )
  )
}
