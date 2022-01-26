# ------------------------------------------------------------------------------
# Business Objects server 2 Security Group and rules
# ------------------------------------------------------------------------------
module "bus_obj_2_ec2_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.0"

  name        = "sgr-${var.application}-bus-obj-2-server"
  description = "Security group for the ${var.application} Business Objects Server 2"
  vpc_id      = data.aws_vpc.vpc.id

  ingress_with_cidr_blocks = [
    {
      from_port   = 135
      to_port     = 135
      protocol    = "tcp"
      cidr_blocks = join(",", local.bus_obj_2_135_cidr_block)
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
      cidr_blocks = join(",", local.bus_obj_2_rdp_cidr_block)
    },
    {
      rule        = "winrm-http-tcp"
      cidr_blocks = "172.16.200.200/32"
    },
    {
      from_port   = 49155
      to_port     = 49155
      protocol    = "tcp"
      cidr_blocks = join(",", local.bus_obj_2_49155_cidr_block)
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

  ]

  ingress_with_self = [
    {
      rule = "oracle-db-tcp"
      self = true
    },
    {
      from_port = 6400
      to_port   = 6400
      protocol  = "tcp"
      self      = true
    },
    {
      from_port = 6410
      to_port   = 6410
      protocol  = "tcp"
      self      = true
    },
    {
      from_port = 49291
      to_port   = 64677
      protocol  = "tcp"
      self      = true
    },
  ]

  egress_rules = ["all-all"]
}

# ------------------------------------------------------------------------------
# Business Objects Server 2 CloudWatch
# ------------------------------------------------------------------------------

resource "aws_cloudwatch_log_group" "bus_obj_2" {
  for_each = local.bus_obj_2_cw_logs

  name              = each.value["log_group_name"]
  retention_in_days = lookup(each.value, "log_group_retention", var.default_log_group_retention_in_days)
  kms_key_id        = lookup(each.value, "kms_key_id", data.aws_kms_key.logs.arn)

  tags = merge(
    local.default_tags,
    map(
      "Name", "${var.application}-bus-obj-2-server",
      "ServiceTeam", var.ServiceTeam
    )
  )
}

# ------------------------------------------------------------------------------
# Business Objects Server 2 EC2
# ------------------------------------------------------------------------------

module "bus_obj_2_ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.19.0"

  name = var.bus_obj_2_ec2_name

  ami                    = var.bus_obj_2_ami
  instance_type          = var.bus_obj_2_ec2_instance_size
  key_name               = aws_key_pair.bus_obj_2_keypair.key_name
  monitoring             = var.monitoring
  get_password_data      = var.get_password_data
  vpc_security_group_ids = [module.bus_obj_2_ec2_security_group.this_security_group_id, data.aws_security_group.rdp_shared.id]
  subnet_id              = coalesce(data.aws_subnet_ids.application.ids...)
  iam_instance_profile   = module.bus_obj_2_profile.aws_iam_instance_profile.name
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
    },
    {
      delete_on_termination = var.delete_on_termination
      device_name           = "/dev/xvdg"
      encrypted             = var.ebs_encrypted
      volume_size           = "150"
      volume_type           = var.volume_type
      kms_key_id            = data.aws_kms_key.ebs.arn
    },
    {
      delete_on_termination = var.delete_on_termination
      device_name           = "/dev/xvdh"
      encrypted             = var.ebs_encrypted
      volume_size           = "20"
      volume_type           = var.volume_type
      kms_key_id            = data.aws_kms_key.ebs.arn
    }
  ]

  tags = merge(
    local.default_tags,
    map(
      "Name", var.bus_obj_2_ec2_name,
      "Application", var.bus_obj_2_application,
      "ServiceTeam", var.ServiceTeam,
      "Backup", "true",
      "BackupApp", var.application
    )
  )

  volume_tags = merge(
    local.default_tags,
    map(
      "Name", var.bus_obj_2_ec2_name,
      "Application", var.bus_obj_2_application,
      "ServiceTeam", var.ServiceTeam,
      "Backup", "true",
      "BackupApp", var.application
    )
  )
}
