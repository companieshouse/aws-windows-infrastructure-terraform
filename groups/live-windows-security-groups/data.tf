# ------------------------------------------------------------------------------
# Data
# ------------------------------------------------------------------------------
data "aws_vpc" "vpc" {
  tags = {
    Name = "vpc-${var.aws_account}"
  }
}

data "vault_generic_secret" "azure_dc_cidrs" {
  path = "applications/${var.aws_account}-${var.aws_region}/${var.application}/azure_dc"
}

data "vault_generic_secret" "sql_cidrs" {
  path = "applications/${var.aws_account}-${var.aws_region}/${var.application}/sql_cidrs"
}

data "vault_generic_secret" "smart_onprem_cidrs" {
  path = "applications/${var.aws_account}-${var.aws_region}/${var.application}/smart_onprem_cidrs"
}
