# ------------------------------------------------------------------------------
# Remittance Processor (Rempro) CloudWatch
# ------------------------------------------------------------------------------

resource "aws_cloudwatch_log_group" "rempro" {
  for_each = local.rempro_cw_logs

  name              = each.value["log_group_name"]
  retention_in_days = lookup(each.value, "log_group_retention", var.default_log_group_retention_in_days)
  kms_key_id        = lookup(each.value, "kms_key_id", data.aws_kms_key.logs.arn)

  tags = merge(
    local.default_tags,
    map(
      "Name", "${var.application}-rempro-server",
      "ServiceTeam", var.ServiceTeam
    )
  )
}

# ------------------------------------------------------------------------------
# Remittance Processor (Rempro) CloudWatch IAM Role
# ------------------------------------------------------------------------------
module "rempro_profile" {
  source = "git@github.com:companieshouse/terraform-modules//aws/instance_profile?ref=tags/1.0.59"

  name       = "rempro-profile"
  enable_SSM = true
  cw_log_group_arns = length(local.rempro_log_groups) > 0 ? flatten([
    formatlist(
      "arn:aws:logs:%s:%s:log-group:%s:*:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.rempro_log_groups
    ),
    formatlist("arn:aws:logs:%s:%s:log-group:%s:*",
      var.aws_region,
      data.aws_caller_identity.current.account_id,
      local.rempro_log_groups
    ),
  ]) : null
  kms_key_refs = [
    "alias/${var.account}/${var.region}/ebs",
    local.ssm_kms_key_id
  ]
  s3_buckets_write = [local.session_manager_bucket_name]
}