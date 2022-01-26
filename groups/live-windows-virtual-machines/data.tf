# ------------------------------------------------------------------------------
# Data
# ------------------------------------------------------------------------------

data "aws_caller_identity" "current" {}

data "aws_vpc" "vpc" {
  tags = {
    Name = "vpc-${var.aws_account}"
  }
}

data "aws_security_group" "rdp_shared" {
  filter {
    name   = "group-name"
    values = ["sgr-rdp-shared-*"]
  }
}

data "aws_subnet_ids" "application" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = ["sub-application-*"]
  }
}

data "vault_generic_secret" "ewok_lic_ec2_data" {
  path = "applications/${var.aws_account}-${var.aws_region}/${var.application}/ewok-license/ec2"
}

data "vault_generic_secret" "abbyy_doc_ocr_ec2_data" {
  path = "applications/${var.aws_account}-${var.aws_region}/${var.application}/abbyy-doc-ocr/ec2"
}

data "vault_generic_secret" "bus_obj_1_ec2_data" {
  path = "applications/${var.aws_account}-${var.aws_region}/${var.application}/bus-obj-1/ec2"
}

data "aws_kms_key" "ebs" {
  key_id = "alias/${var.account}/${var.region}/ebs"
}

data "aws_kms_key" "logs" {
  key_id = "alias/${var.account}/${var.region}/logs"
}

data "vault_generic_secret" "kms_keys" {
  path = "aws-accounts/${var.aws_account}/kms"
}

data "vault_generic_secret" "security_kms_keys" {
  path = "aws-accounts/security/kms"
}

data "vault_generic_secret" "security_s3_buckets" {
  path = "aws-accounts/security/s3"
}