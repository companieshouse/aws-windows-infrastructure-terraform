# ------------------------------------------------------------------------------
# Test 2019 server 1 Security Group and rules
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
      "BackupApp", var.application
    )
  )

  volume_tags = merge(
    local.default_tags,
    map(
      "Name", var.test_2019_1_ec2_name,
      "Application", var.test_2019_1_application,
      "ServiceTeam", var.ServiceTeam,
      "Backup", "backup14",
      "BackupApp", var.application
    )
  )
}
