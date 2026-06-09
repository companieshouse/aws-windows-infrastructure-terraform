# ------------------------------------------------------------------------------
# Test 2019 Server 2 EC2
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# Locals (deduplicate tags)
# ------------------------------------------------------------------------------

locals {
  common_tags = merge(local.default_tags, {
    Application     = var.test_2019_2_application
    ServiceTeam     = var.ServiceTeam
    Backup          = "backup14"
    BackupApp       = var.application
    scheduled_stop  = var.scheduled_stop
  })

  instance_tags = merge(local.common_tags, {
    Name            = var.test_2019_2_ec2_name
    DevelopmentTeam = "None"
    Owner           = "MSS"
  })

  volume_tags = merge(local.common_tags, {
    Name = var.test_2019_2_ec2_name
  })
}

# ------------------------------------------------------------------------------
# EC2 Instance
# ------------------------------------------------------------------------------

module "test_2019_2_ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.8.0"

  name = var.test_2019_2_ec2_name

  ami                    = var.test_2019_2_ami
  instance_type          = var.test_2019_2_ec2_instance_size
  key_name               = aws_key_pair.test_2019_2_keypair.key_name
  monitoring             = var.monitoring
  get_password_data      = var.get_password_data
  subnet_id              = one(data.aws_subnets.application.ids)
  iam_instance_profile   = module.test_2019_2_profile.aws_iam_instance_profile.name
  ebs_optimized          = var.ebs_optimized

  vpc_security_group_ids = [
    module.test_2019_1_ec2_security_group.security_group_id,
    data.aws_security_group.rdp_shared.id
  ]

  metadata_options = {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
  }

  root_block_device = [
    {
      delete_on_termination = var.delete_on_termination
      volume_size           = 80
      volume_type           = var.volume_type
      encrypted             = var.ebs_encrypted
      kms_key_id            = data.aws_kms_key.ebs.arn
    }
  ]

  tags        = local.instance_tags
  volume_tags = local.volume_tags
}

# ------------------------------------------------------------------------------
# Variables
# ------------------------------------------------------------------------------

variable "ebs_volumes_test_2019_2" {
  description = "Additional EBS volumes for test_2019_2"
  type = list(object({
    name        = string
    device_name = string
    size        = number
  }))
  default = []
}

# ------------------------------------------------------------------------------
# EBS Volumes
# ------------------------------------------------------------------------------

resource "aws_ebs_volume" "test_2019_2" {
  for_each = { for v in var.ebs_volumes_test_2019_2 : v.name => v }

  availability_zone = module.test_2019_2_ec2.availability_zone
  size              = each.value.size
  type              = "gp3"

  iops       = 3000
  throughput = 125

  encrypted  = var.ebs_encrypted
  kms_key_id = data.aws_kms_key.ebs.arn

  tags = merge(local.common_tags, {
    Name = "${var.test_2019_2_ec2_name}-${each.key}"
  })

  lifecycle {
    prevent_destroy = true
  }
}

# ------------------------------------------------------------------------------
# Volume Attachments
# ------------------------------------------------------------------------------

resource "aws_volume_attachment" "test_2019_2" {
  for_each = aws_ebs_volume.test_2019_2

  device_name = each.value.tags["Name"] != "" ? each.value.tags["Name"] : each.key
  volume_id   = each.value.id
  instance_id = module.test_2019_2_ec2.id

  force_detach = false
}