# ------------------------------------------------------------------------------
# Designer CloudWatch
# ------------------------------------------------------------------------------

resource "aws_cloudwatch_log_group" "designer" {
  for_each = local.designer_cw_logs

  name              = each.value["log_group_name"]
  retention_in_days = lookup(each.value, "log_group_retention", var.default_log_group_retention_in_days)
  kms_key_id        = lookup(each.value, "kms_key_id", data.aws_kms_key.logs.arn)

  tags = merge(
    local.default_tags,
    map(
      "Name", "${var.application}-designer-server",
      "ServiceTeam", var.ServiceTeam
    )
  )
}

# ------------------------------------------------------------------------------
# Generate CloudWatch
# ------------------------------------------------------------------------------

resource "aws_cloudwatch_log_group" "generate" {
  for_each = local.generate_cw_logs

  name              = each.value["log_group_name"]
  retention_in_days = lookup(each.value, "log_group_retention", var.default_log_group_retention_in_days)
  kms_key_id        = lookup(each.value, "kms_key_id", data.aws_kms_key.logs.arn)

  tags = merge(
    local.default_tags,
    map(
      "Name", "${var.application}-generate-server",
      "ServiceTeam", var.ServiceTeam
    )
  )
}

# ------------------------------------------------------------------------------
# Smart Vault CloudWatch
# ------------------------------------------------------------------------------

resource "aws_cloudwatch_log_group" "smart_vault" {
  for_each = local.smart_vault_cw_logs

  name              = each.value["log_group_name"]
  retention_in_days = lookup(each.value, "log_group_retention", var.default_log_group_retention_in_days)
  kms_key_id        = lookup(each.value, "kms_key_id", data.aws_kms_key.logs.arn)

  tags = merge(
    local.default_tags,
    map(
      "Name", "${var.application}-smart-vault-server",
      "ServiceTeam", var.ServiceTeam
    )
  )
}

# ------------------------------------------------------------------------------
# Chips Estor CloudWatch
# ------------------------------------------------------------------------------

resource "aws_cloudwatch_log_group" "chips_estor" {
  for_each = local.chips_estor_cw_logs

  name              = each.value["log_group_name"]
  retention_in_days = lookup(each.value, "log_group_retention", var.default_log_group_retention_in_days)
  kms_key_id        = lookup(each.value, "kms_key_id", data.aws_kms_key.logs.arn)

  tags = merge(
    local.default_tags,
    map(
      "Name", "${var.application}-chips-estor-server",
      "ServiceTeam", var.ServiceTeam
    )
  )
}