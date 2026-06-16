# ------------------------------------------------------------------------------
# EC2 Instance - Folding Space Server 1 in Staging 
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# Locals (single source of truth for subnet)
# ------------------------------------------------------------------------------

locals {
  foldstage_1_subnet_id = coalesce(data.aws_subnets.application.ids...)
}

# ------------------------------------------------------------------------------
# What are we going to create 
# ------------------------------------------------------------------------------

module "foldstage_1_ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.8.0"

  name = var.foldstage_1_ec2_name

  ami                    = var.foldstage_1_ami
  instance_type          = var.foldstage_1_ec2_instance_size
  key_name               = aws_key_pair.foldstage_1_keypair.key_name
  monitoring             = var.monitoring
  get_password_data      = var.get_password_data

  vpc_security_group_ids = [
     #  module.foldstage_1_ec2_security_group.security_group_id,
     #  data.aws_security_group.rdp_shared.id

    module.test_2019_1_ec2_security_group.security_group_id,
    data.aws_security_group.rdp_shared.id
  ]

  subnet_id            = local.foldstage_1_subnet_id
  iam_instance_profile = module.foldstage_1_profile.aws_iam_instance_profile.name
  ebs_optimized        = var.ebs_optimized

  # ✅ IMPORTANT: REMOVE volume_tags to stop tag conflict
  volume_tags = {}

  # ✅ Root disk only
  root_block_device = [
    {
      delete_on_termination = var.delete_on_termination
      volume_size           = 300
      volume_type           = var.volume_type
      encrypted             = var.ebs_encrypted
      kms_key_id            = data.aws_kms_key.ebs.arn
    }
  ]

  tags = merge(local.default_tags, {
    Name            = var.foldstage_1_ec2_name
    Application     = var.foldstage_1_application
    ServiceTeam     = var.ServiceTeam
    Backup          = "backup14"
    BackupApp       = var.application
    scheduled_stop  = var.scheduled_stop
    DevelopmentTeam = "None"
    Owner           = "CSI"
  })
}

# ------------------------------------------------------------------------------
# Get AZ from subnet
# ------------------------------------------------------------------------------

data "aws_subnet" "foldstage_1" {
  id = local.foldstage_1_subnet_id
}

# ------------------------------------------------------------------------------
# Variables
# ------------------------------------------------------------------------------

variable "ebs_volumes_foldstage_1" {
  type = list(object({
    name        = string
    device_name = string
    size        = number
    type        = optional(string)
    iops        = optional(number)
    throughput  = optional(number)
  }))
}

# ------------------------------------------------------------------------------
# EBS Volumes (data disks ONLY) Creates the Required Storage from the Vars File
# ------------------------------------------------------------------------------

resource "aws_ebs_volume" "foldstage_1" {
  for_each = { for v in var.ebs_volumes_foldstage_1 : v.name => v }

  availability_zone = data.aws_subnet.foldstage_1.availability_zone
  size              = each.value.size

  type       = lookup(each.value, "type", "gp3")
  iops       = lookup(each.value, "iops", 3000)
  throughput = lookup(each.value, "throughput", 125)

  encrypted  = var.ebs_encrypted
  kms_key_id = data.aws_kms_key.ebs.arn

  tags = merge(local.default_tags, {
    Name           = "${var.foldstage_1_ec2_name}-${each.key}"
    Application    = var.foldstage_1_application
    ServiceTeam    = var.ServiceTeam
    Backup         = "backup14"
    BackupApp      = var.application
    scheduled_stop = var.scheduled_stop
  })

lifecycle {
  prevent_destroy = true

  ignore_changes = [
    tags,
    tags_all
  ]
}
}

# -------------------------------------------------------------------------------------------
# Volume Attachments - Disks get created above but not attached to Device until this bit runs 
# -------------------------------------------------------------------------------------------

resource "aws_volume_attachment" "foldstage_1" {
  for_each = { for v in var.ebs_volumes_foldstage_1 : v.name => v }

  device_name = each.value.device_name
  volume_id   = aws_ebs_volume.foldstage_1[each.key].id
  instance_id = module.foldstage_1_ec2.id

  force_detach = false
}