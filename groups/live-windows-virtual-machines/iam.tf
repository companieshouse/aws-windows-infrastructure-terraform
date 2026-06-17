module "ewok_lic_bac_profile" {
  source = "git@github.com:companieshouse/terraform-modules//aws/instance_profile?ref=tags/1.0.365"

  name       = "ewok-lic-backup-profile"
  enable_ssm = true
  cw_log_group_arns = length(local.ewok_lic_bac_log_groups) > 0 ? flatten([
    formatlist(
      "arn:aws:logs:%s:%s:log-group:%s:*:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.ewok_lic_bac_log_groups
    ),
    formatlist("arn:aws:logs:%s:%s:log-group:%s:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.ewok_lic_bac_log_groups
    ),
  ]) : null
  kms_key_refs = [
    "alias/${var.account}/${var.region}/ebs",
    local.ssm_kms_key_id
  ]
  s3_buckets_write = [local.session_manager_bucket_name]

  custom_statements = [
    {
      sid       = "CloudwatchMetrics"
      effect    = "Allow"
      resources = ["*"]
      actions = [
        "cloudwatch:PutMetricData"
      ]
    }
  ]
}

module "ewok_lic_sec_profile" {
  source = "git@github.com:companieshouse/terraform-modules//aws/instance_profile?ref=tags/1.0.365"

  name       = "ewok-lic-second-profile"
  enable_ssm = true
  cw_log_group_arns = length(local.ewok_lic_sec_log_groups) > 0 ? flatten([
    formatlist(
      "arn:aws:logs:%s:%s:log-group:%s:*:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.ewok_lic_sec_log_groups
    ),
    formatlist("arn:aws:logs:%s:%s:log-group:%s:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.ewok_lic_sec_log_groups
    ),
  ]) : null
  kms_key_refs = [
    "alias/${var.account}/${var.region}/ebs",
    local.ssm_kms_key_id
  ]
  s3_buckets_write = [local.session_manager_bucket_name]

  custom_statements = [
    {
      sid       = "CloudwatchMetrics"
      effect    = "Allow"
      resources = ["*"]
      actions = [
        "cloudwatch:PutMetricData"
      ]
    }
  ]
}

module "abbyy_doc_ocr_profile" {
  source = "git@github.com:companieshouse/terraform-modules//aws/instance_profile?ref=tags/1.0.365"

  name       = "abbyy-doc-ocr-profile"
  enable_ssm = true
  cw_log_group_arns = length(local.abbyy_doc_ocr_log_groups) > 0 ? flatten([
    formatlist(
      "arn:aws:logs:%s:%s:log-group:%s:*:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.abbyy_doc_ocr_log_groups
    ),
    formatlist("arn:aws:logs:%s:%s:log-group:%s:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.abbyy_doc_ocr_log_groups
    ),
  ]) : null
  kms_key_refs = [
    "alias/${var.account}/${var.region}/ebs",
    local.ssm_kms_key_id
  ]
  s3_buckets_write = [local.session_manager_bucket_name]

  custom_statements = [
    {
      sid       = "CloudwatchMetrics"
      effect    = "Allow"
      resources = ["*"]
      actions = [
        "cloudwatch:PutMetricData"
      ]
    }
  ]
}

module "bus_obj_1_profile" {
  source = "git@github.com:companieshouse/terraform-modules//aws/instance_profile?ref=tags/1.0.365"

  name       = "bus-obj-1-profile"
  enable_ssm = true
  cw_log_group_arns = length(local.bus_obj_1_log_groups) > 0 ? flatten([
    formatlist(
      "arn:aws:logs:%s:%s:log-group:%s:*:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.bus_obj_1_log_groups
    ),
    formatlist("arn:aws:logs:%s:%s:log-group:%s:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.bus_obj_1_log_groups
    ),
  ]) : null
  kms_key_refs = [
    "alias/${var.account}/${var.region}/ebs",
    local.ssm_kms_key_id
  ]
  s3_buckets_write = [local.session_manager_bucket_name]

  custom_statements = [
    {
      sid       = "CloudwatchMetrics"
      effect    = "Allow"
      resources = ["*"]
      actions = [
        "cloudwatch:PutMetricData"
      ]
    }
  ]
}


module "live_test_1_profile" {
  source = "git@github.com:companieshouse/terraform-modules//aws/instance_profile?ref=tags/1.0.365"

  name       = "live-test-1-profile"
  enable_ssm = true
  cw_log_group_arns = length(local.live_test_1_log_groups) > 0 ? flatten([
    formatlist(
      "arn:aws:logs:%s:%s:log-group:%s:*:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.live_test_1_log_groups
    ),
    formatlist("arn:aws:logs:%s:%s:log-group:%s:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.live_test_1_log_groups
    ),
  ]) : null
  kms_key_refs = [
    "alias/${var.account}/${var.region}/ebs",
    local.ssm_kms_key_id
  ]
  s3_buckets_write = [local.session_manager_bucket_name]

  custom_statements = [
    {
      sid       = "CloudwatchMetrics"
      effect    = "Allow"
      resources = ["*"]
      actions = [
        "cloudwatch:PutMetricData"
      ]
    }
  ]
}



module "live_test_2025_2_profile" {
  source = "git@github.com:companieshouse/terraform-modules//aws/instance_profile?ref=tags/1.0.365"

  name       = "live-test-2025-2-profile"
  enable_ssm = true
  cw_log_group_arns = length(local.live_test_2025_2_log_groups) > 0 ? flatten([
    formatlist(
      "arn:aws:logs:%s:%s:log-group:%s:*:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.live_test_2025_2_log_groups
    ),
    formatlist("arn:aws:logs:%s:%s:log-group:%s:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.live_test_2025_2_log_groups
    ),
  ]) : null
  kms_key_refs = [
    "alias/${var.account}/${var.region}/ebs",
    local.ssm_kms_key_id
  ]
  s3_buckets_write = [local.session_manager_bucket_name]

  custom_statements = [
    {
      sid       = "CloudwatchMetrics"
      effect    = "Allow"
      resources = ["*"]
      actions = [
        "cloudwatch:PutMetricData"
      ]
    }
  ]
}

module "qrmad_1_profile" {
  source = "git@github.com:companieshouse/terraform-modules//aws/instance_profile?ref=tags/1.0.365"

  name       = "qrmad-1-profile"
  enable_ssm = true
  cw_log_group_arns = length(local.qrmad_1_log_groups) > 0 ? flatten([
    formatlist(
      "arn:aws:logs:%s:%s:log-group:%s:*:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.qrmad_1_log_groups
    ),
    formatlist("arn:aws:logs:%s:%s:log-group:%s:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.qrmad_1_log_groups
    ),
  ]) : null
  kms_key_refs = [
    "alias/${var.account}/${var.region}/ebs",
    local.ssm_kms_key_id
  ]
  s3_buckets_write = [local.session_manager_bucket_name]

  custom_statements = [
    {
      sid       = "CloudwatchMetrics"
      effect    = "Allow"
      resources = ["*"]
      actions = [
        "cloudwatch:PutMetricData"
      ]
    }
  ]
}


module "qdc_1_profile" {
  source = "git@github.com:companieshouse/terraform-modules//aws/instance_profile?ref=tags/1.0.365"

  name       = "qdc-1-profile"
  enable_ssm = true
  cw_log_group_arns = length(local.qdc_1_log_groups) > 0 ? flatten([
    formatlist(
      "arn:aws:logs:%s:%s:log-group:%s:*:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.qdc_1_log_groups
    ),
    formatlist("arn:aws:logs:%s:%s:log-group:%s:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.qdc_1_log_groups
    ),
  ]) : null
  kms_key_refs = [
    "alias/${var.account}/${var.region}/ebs",
    local.ssm_kms_key_id
  ]
  s3_buckets_write = [local.session_manager_bucket_name]

  custom_statements = [
    {
      sid       = "CloudwatchMetrics"
      effect    = "Allow"
      resources = ["*"]
      actions = [
        "cloudwatch:PutMetricData"
      ]
    }
  ]
}

module "foldlive_1_profile" {
  source = "git@github.com:companieshouse/terraform-modules//aws/instance_profile?ref=tags/1.0.365"

  name       = "foldlive-1-profile"
  enable_ssm = true
  cw_log_group_arns = length(local.foldlive_1_log_groups) > 0 ? flatten([
    formatlist(
      "arn:aws:logs:%s:%s:log-group:%s:*:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.foldlive_1_log_groups
    ),
    formatlist("arn:aws:logs:%s:%s:log-group:%s:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.foldlive_1_log_groups
    ),
  ]) : null
  kms_key_refs = [
    "alias/${var.account}/${var.region}/ebs",
    local.ssm_kms_key_id
  ]
  s3_buckets_write = [local.session_manager_bucket_name]

  custom_statements = [
    {
      sid       = "CloudwatchMetrics"
      effect    = "Allow"
      resources = ["*"]
      actions = [
        "cloudwatch:PutMetricData"
      ]
    }
  ]
}

module "smartv_1_profile" {
  source = "git@github.com:companieshouse/terraform-modules//aws/instance_profile?ref=tags/1.0.365"

  name       = "smartv-1-profile"
  enable_ssm = true
  cw_log_group_arns = length(local.smartv_1_log_groups) > 0 ? flatten([
    formatlist(
      "arn:aws:logs:%s:%s:log-group:%s:*:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.smartv_1_log_groups
    ),
    formatlist("arn:aws:logs:%s:%s:log-group:%s:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.smartv_1_log_groups
    ),
  ]) : null
  kms_key_refs = [
    "alias/${var.account}/${var.region}/ebs",
    local.ssm_kms_key_id
  ]
  s3_buckets_write = [local.session_manager_bucket_name]

  custom_statements = [
    {
      sid       = "CloudwatchMetrics"
      effect    = "Allow"
      resources = ["*"]
      actions = [
        "cloudwatch:PutMetricData"
      ]
    }
  ]
}

module "smartv_2_profile" {
  source = "git@github.com:companieshouse/terraform-modules//aws/instance_profile?ref=tags/1.0.365"

  name       = "smartv-2-profile"
  enable_ssm = true
  cw_log_group_arns = length(local.smartv_2_log_groups) > 0 ? flatten([
    formatlist(
      "arn:aws:logs:%s:%s:log-group:%s:*:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.smartv_2_log_groups
    ),
    formatlist("arn:aws:logs:%s:%s:log-group:%s:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.smartv_2_log_groups
    ),
  ]) : null
  kms_key_refs = [
    "alias/${var.account}/${var.region}/ebs",
    local.ssm_kms_key_id
  ]
  s3_buckets_write = [local.session_manager_bucket_name]

  custom_statements = [
    {
      sid       = "CloudwatchMetrics"
      effect    = "Allow"
      resources = ["*"]
      actions = [
        "cloudwatch:PutMetricData"
      ]
    }
  ]
}