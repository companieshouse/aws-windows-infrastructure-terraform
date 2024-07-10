# ------------------------------------------------------------------------------
# Business Objects server 1 Security Group and rules
# ------------------------------------------------------------------------------
module "bus_obj_1_ec2_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.0"

  name        = "sgr-${var.application}-bus-obj-1-server"
  description = "Security group for the ${var.application} Business Objects Server 1"
  vpc_id      = data.aws_vpc.vpc.id

  ingress_with_cidr_blocks = [
    {
      from_port   = 135
      to_port     = 135
      protocol    = "tcp"
      cidr_blocks = join(",", local.bus_obj_1_135_cidr_block)
    },
    {
      from_port   = 445
      to_port     = 445
      protocol    = "tcp"
      cidr_blocks = join(",", local.bus_obj_1_445_cidr_block)
    },
    {
      from_port   = 1000
      to_port     = 1000
      protocol    = "tcp"
      cidr_blocks = "172.16.200.58/32"
    },
    {
      rule        = "oracle-db-tcp"
      cidr_blocks = "172.24.4.129/32"
    },
    {
      rule        = "rdp-tcp"
      cidr_blocks = join(",", local.bus_obj_1_rdp_cidr_block)
    },
    {
      rule        = "winrm-http-tcp"
      cidr_blocks = "172.16.200.200/32"
    },
    {
      from_port   = 6129
      to_port     = 6129
      protocol    = "tcp"
      cidr_blocks = join(",", local.bus_obj_1_6129_cidr_block)
    },
    {
      from_port   = 6400
      to_port     = 6414
      protocol    = "tcp"
      cidr_blocks = join(",", local.bus_obj_1_6400_6414_cidr_block)
    },
    {
      rule        = "http-8080-tcp"
      cidr_blocks = join(",", local.bus_obj_1_8080_cidr_block)
    },
    {
      from_port   = 49155
      to_port     = 49155
      protocol    = "tcp"
      cidr_blocks = join(",", local.bus_obj_1_49155_cidr_block)
    },
    {
      from_port   = 49512
      to_port     = 49512
      protocol    = "tcp"
      cidr_blocks = "172.24.9.53/32"
    },
    {
      from_port   = 50640
      to_port     = 50640
      protocol    = "tcp"
      cidr_blocks = "172.16.200.58/32"
    },
    {
      from_port   = 51134
      to_port     = 51134
      protocol    = "tcp"
      cidr_blocks = join(",", local.bus_obj_1_51134_cidr_block)
    },
    {
      from_port   = 51282
      to_port     = 51282
      protocol    = "tcp"
      cidr_blocks = "172.16.101.82/32"
    },
    {
      from_port   = 51460
      to_port     = 51463
      protocol    = "tcp"
      cidr_blocks = "10.172.0.0/17"
    },
    {
      from_port   = 51706
      to_port     = 51706
      protocol    = "tcp"
      cidr_blocks = "172.16.200.0/24"
    },
    {
      from_port   = 53345
      to_port     = 53345
      protocol    = "tcp"
      cidr_blocks = "172.16.202.81/32"
    },
    {
      from_port   = 54666
      to_port     = 54666
      protocol    = "tcp"
      cidr_blocks = "10.128.1.4/32"
    },
    {
      from_port   = 55012
      to_port     = 55012
      protocol    = "tcp"
      cidr_blocks = join(",", local.bus_obj_1_55012_cidr_block)
    },
    {
      from_port   = 55105
      to_port     = 55105
      protocol    = "tcp"
      cidr_blocks = "172.16.202.82/32"
    },
    {
      from_port   = 55257
      to_port     = 55257
      protocol    = "tcp"
      cidr_blocks = join(",", local.bus_obj_1_55257_cidr_block)
    },
    {
      from_port   = 55311
      to_port     = 55311
      protocol    = "tcp"
      cidr_blocks = join(",", local.bus_obj_1_55311_cidr_block)
    },
    {
      from_port   = 56018
      to_port     = 56018
      protocol    = "tcp"
      cidr_blocks = "172.16.202.91/32"
    },
    {
      from_port   = 56744
      to_port     = 56745
      protocol    = "tcp"
      cidr_blocks = "172.16.202.81/32"
    },
    {
      from_port   = 57021
      to_port     = 57021
      protocol    = "tcp"
      cidr_blocks = "172.16.202.82/32"
    },
    {
      from_port   = 58269
      to_port     = 58269
      protocol    = "tcp"
      cidr_blocks = "172.16.200.196/32"
    },
    {
      from_port   = 58868
      to_port     = 58868
      protocol    = "tcp"
      cidr_blocks = "172.16.200.196/32"
    },
    {
      from_port   = 59351
      to_port     = 59351
      protocol    = "tcp"
      cidr_blocks = "172.16.202.82/32"
    },
    {
      from_port   = 59635
      to_port     = 59635
      protocol    = "tcp"
      cidr_blocks = "172.16.202.81/32"
    },
    {
      from_port   = 59966
      to_port     = 59966
      protocol    = "tcp"
      cidr_blocks = "172.24.9.53/32"
    },
    {
      from_port   = 62243
      to_port     = 62243
      protocol    = "tcp"
      cidr_blocks = "172.24.9.53/32"
    },
    {
      from_port   = 62341
      to_port     = 62341
      protocol    = "tcp"
      cidr_blocks = "172.16.202.81/32"
    },
    {
      from_port   = 63108
      to_port     = 63108
      protocol    = "tcp"
      cidr_blocks = "172.16.202.82/32"
    },
    {
      from_port   = 63712
      to_port     = 63712
      protocol    = "tcp"
      cidr_blocks = "10.80.10.48/32"
    },
    {
      from_port   = 49208
      to_port     = 65370
      protocol    = "tcp"
      cidr_blocks = "172.16.200.9/32"
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
      from_port = 49163
      to_port   = 65528
      protocol  = "tcp"
      self      = true
    },
  ]

  egress_rules = ["all-all"]
}

resource "aws_security_group" "bus_obj_1_server_web_sg" {
  name        = "sgr-${var.application}-bus-obj-1-web"
  description = "Security group for web access to the ${var.application} Business Objects Server 1"
  vpc_id      = data.aws_vpc.vpc.id

  tags = local.default_tags
}

resource "aws_security_group_rule" "http" {
  description       = "HTTP 8080 from admin prefix list cidrs"
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  prefix_list_ids   = [data.aws_ec2_managed_prefix_list.administration.id]
  security_group_id = aws_security_group.bus_obj_1_server_web_sg.id
}

resource "aws_security_group_rule" "https" {
  description       = "HTTPS 443 from admin prefix list cidrs"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  prefix_list_ids   = [data.aws_ec2_managed_prefix_list.administration.id]
  security_group_id = aws_security_group.bus_obj_1_server_web_sg.id
}

# ------------------------------------------------------------------------------
# Business Objects Server 1 CloudWatch
# ------------------------------------------------------------------------------

resource "aws_cloudwatch_log_group" "bus_obj_1" {
  for_each = local.bus_obj_1_cw_logs

  name              = each.value["log_group_name"]
  retention_in_days = lookup(each.value, "log_group_retention", var.default_log_group_retention_in_days)
  kms_key_id        = lookup(each.value, "kms_key_id", data.aws_kms_key.logs.arn)

  tags = merge(
    local.default_tags,
    map(
      "Name", "${var.application}-bus-obj-1-server",
      "ServiceTeam", var.ServiceTeam
    )
  )
}

# ------------------------------------------------------------------------------
# Business Objects Server 1 EC2
# ------------------------------------------------------------------------------

module "bus_obj_1_ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.19.0"

  name = var.bus_obj_1_ec2_name

  ami               = var.bus_obj_1_ami
  instance_type     = var.bus_obj_1_ec2_instance_size
  key_name          = aws_key_pair.bus_obj_1_keypair.key_name
  monitoring        = var.monitoring
  get_password_data = var.get_password_data
  vpc_security_group_ids = [
    module.bus_obj_1_ec2_security_group.this_security_group_id,
    data.aws_security_group.rdp_shared.id,
    aws_security_group.bus_obj_1_server_web_sg.id
  ]
  subnet_id            = coalesce(data.aws_subnet_ids.application.ids...)
  iam_instance_profile = module.bus_obj_1_profile.aws_iam_instance_profile.name
  ebs_optimized        = var.ebs_optimized

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
      volume_size           = "80"
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
      volume_size           = "40"
      volume_type           = var.volume_type
      kms_key_id            = data.aws_kms_key.ebs.arn
    }
  ]

  tags = merge(
    local.default_tags,
    map(
      "Name", var.bus_obj_1_ec2_name,
      "Application", var.bus_obj_1_application,
      "ServiceTeam", var.ServiceTeam,
      "Backup", "backup21",
      "BackupApp", var.application
    )
  )

  volume_tags = merge(
    local.default_tags,
    map(
      "Name", var.bus_obj_1_ec2_name,
      "Application", var.bus_obj_1_application,
      "ServiceTeam", var.ServiceTeam,
      "Backup", "backup21",
      "BackupApp", var.application
    )
  )
}
