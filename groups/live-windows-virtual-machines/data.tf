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

data "aws_ec2_managed_prefix_list" "administration" {
  name = "administration-cidr-ranges"
}

data "aws_subnets" "application" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
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

data "vault_generic_secret" "live_test_1_ec2_data" {
  path = "applications/${var.aws_account}-${var.aws_region}/${var.application}/live-test-1/ec2"
}

data "vault_generic_secret" "live_test_2025_2_ec2_data" {
#  path = "applications/${var.aws_account}-${var.aws_region}/${var.application}/live-test-2025-2/ec2"
  path = "applications/${var.aws_account}-${var.aws_region}/${var.application}/live-test-1/ec2"
}

data "vault_generic_secret" "qrmad_1_ec2_data" {
#  path = "applications/${var.aws_account}-${var.aws_region}/${var.application}/live-qrmad_1/ec2"
  path = "applications/${var.aws_account}-${var.aws_region}/${var.application}/live-test-1/ec2"
}

data "vault_generic_secret" "qdc_1_ec2_data" {
#  path = "applications/${var.aws_account}-${var.aws_region}/${var.application}/live-qdc_1/ec2"
  path = "applications/${var.aws_account}-${var.aws_region}/${var.application}/live-test-1/ec2"
}

data "vault_generic_secret" "foldlive_1_ec2_data" {
#  path = "applications/${var.aws_account}-${var.aws_region}/${var.application}/live-foldlive_1/ec2"
  path = "applications/${var.aws_account}-${var.aws_region}/${var.application}/live-test-1/ec2"
}

data "vault_generic_secret" "smartv_1_ec2_data" {
#  path = "applications/${var.aws_account}-${var.aws_region}/${var.application}/live-smartv_1/ec2"
  path = "applications/${var.aws_account}-${var.aws_region}/${var.application}/live-test-1/ec2"
}

data "vault_generic_secret" "smartv_2_ec2_data" {
#  path = "applications/${var.aws_account}-${var.aws_region}/${var.application}/live-smartv_2/ec2"
  path = "applications/${var.aws_account}-${var.aws_region}/${var.application}/live-test-1/ec2"
}

data "vault_generic_secret" "doc1da_ec2_data" {
#  path = "applications/${var.aws_account}-${var.aws_region}/${var.application}/live-doc1da/ec2"
  path = "applications/${var.aws_account}-${var.aws_region}/${var.application}/live-test-1/ec2"
}

data "vault_generic_secret" "azure_dc_cidrs" {
  path = "applications/${var.aws_account}-${var.aws_region}/${var.application}/azure_dc"
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
