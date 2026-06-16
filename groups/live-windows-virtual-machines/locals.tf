# ------------------------------------------------------------------------
# Locals
# ------------------------------------------------------------------------
locals {

  kms_keys_data               = data.vault_generic_secret.kms_keys.data
  security_kms_keys_data      = data.vault_generic_secret.security_kms_keys.data
  ssm_kms_key_id              = local.security_kms_keys_data["session-manager-kms-key-arn"]
  security_s3_data            = data.vault_generic_secret.security_s3_buckets.data
  session_manager_bucket_name = local.security_s3_data["session-manager-bucket-name"]

  default_tags = {
    Terraform   = "true"
    Application = upper(var.application)
    Region      = var.aws_region
    Account     = var.aws_account
  }

  # ------------------------------------------------------------------------------
  # Ewok License Backup Server locals
  # ------------------------------------------------------------------------------

  ewok_lic_ec2_data = data.vault_generic_secret.ewok_lic_ec2_data.data

  #For each log map passed, add an extra kv for the log group name
  ewok_lic_bac_cw_logs = { for log, map in var.ewok_lic_bac_cw_logs : log => merge(map, { "log_group_name" = "${var.application}-ewok-lic-backup-${log}" }) }

  ewok_lic_bac_log_groups = compact([for log, map in local.ewok_lic_bac_cw_logs : lookup(map, "log_group_name", "")])


  # ------------------------------------------------------------------------------
  # Ewok License Second Server locals
  # ------------------------------------------------------------------------------

  #For each log map passed, add an extra kv for the log group name
  ewok_lic_sec_cw_logs = { for log, map in var.ewok_lic_sec_cw_logs : log => merge(map, { "log_group_name" = "${var.application}-ewok-lic-second-${log}" }) }

  ewok_lic_sec_log_groups = compact([for log, map in local.ewok_lic_sec_cw_logs : lookup(map, "log_group_name", "")])

  # ------------------------------------------------------------------------------
  # ABBYY Document Capture & OCR Server locals
  # ------------------------------------------------------------------------------

  abbyy_doc_ocr_ec2_data = data.vault_generic_secret.abbyy_doc_ocr_ec2_data.data

  #For each log map passed, add an extra kv for the log group name
  abbyy_doc_ocr_cw_logs = { for log, map in var.abbyy_doc_ocr_cw_logs : log => merge(map, { "log_group_name" = "${var.application}-abbyy-doc-ocr-${log}" }) }

  abbyy_doc_ocr_log_groups = compact([for log, map in local.abbyy_doc_ocr_cw_logs : lookup(map, "log_group_name", "")])

  # ------------------------------------------------------------------------------
  # Business Objects Server 1 locals
  # ------------------------------------------------------------------------------

  bus_obj_1_ec2_data = data.vault_generic_secret.bus_obj_1_ec2_data.data

  #For each log map passed, add an extra kv for the log group name
  bus_obj_1_cw_logs = { for log, map in var.bus_obj_1_cw_logs : log => merge(map, { "log_group_name" = "${var.application}-bus-obj-1-${log}" }) }

  bus_obj_1_log_groups = compact([for log, map in local.bus_obj_1_cw_logs : lookup(map, "log_group_name", "")])

  # ------------------------------------------------------------------------------
  # Live Test Server 1 locals
  # ------------------------------------------------------------------------------

  live_test_1_ec2_data = data.vault_generic_secret.live_test_1_ec2_data.data

  #For each log map passed, add an extra kv for the log group name
  live_test_1_cw_logs = { for log, map in var.live_test_1_cw_logs : log => merge(map, { "log_group_name" = "${var.application}-live-test-1-${log}" }) }

  live_test_1_log_groups = compact([for log, map in local.live_test_1_cw_logs : lookup(map, "log_group_name", "")])

 # ------------------------------------------------------------------------------
  # Live Test 2025 Server 2 locals
  # ------------------------------------------------------------------------------

  live_test_2025_2_ec2_data = data.vault_generic_secret.live_test_2025_2_ec2_data.data

  #For each log map passed, add an extra kv for the log group name
  live_test_2025_2_cw_logs = { for log, map in var.live_test_2025_2_cw_logs : log => merge(map, { "log_group_name" = "${var.application}-live-test-2025-2-${log}" }) }

  live_test_2025_2_log_groups = compact([for log, map in local.live_test_2025_2_cw_logs : lookup(map, "log_group_name", "")])

# ------------------------------------------------------------------------------
  # Live qrmad 1 locals
  # ------------------------------------------------------------------------------

  qrmad_1_ec2_data = data.vault_generic_secret.qrmad_1_ec2_data.data

  #For each log map passed, add an extra kv for the log group name
  qrmad_1_cw_logs = { for log, map in var.qrmad_1_cw_logs : log => merge(map, { "log_group_name" = "${var.application}-qrmad-1-${log}" }) }

  qrmad_1_log_groups = compact([for log, map in local.qrmad_1_cw_logs : lookup(map, "log_group_name", "")])

# ------------------------------------------------------------------------------
  # Live qrmad 1 locals
  # ------------------------------------------------------------------------------

  qdc_1_ec2_data = data.vault_generic_secret.qdc_1_ec2_data.data

  #For each log map passed, add an extra kv for the log group name
  qdc_1_cw_logs = { for log, map in var.qdc_1_cw_logs : log => merge(map, { "log_group_name" = "${var.application}-qrmad-1-${log}" }) }

  qdc_1_log_groups = compact([for log, map in local.qdc_1_cw_logs : lookup(map, "log_group_name", "")])

# ------------------------------------------------------------------------------
# Live foldlive_1 locals
  # ------------------------------------------------------------------------------

  foldlive_1_ec2_data = data.vault_generic_secret.foldlive_1_ec2_data.data

  #For each log map passed, add an extra kv for the log group name
  foldlive_1_cw_logs = { for log, map in var.foldlive_1_cw_logs : log => merge(map, { "log_group_name" = "${var.application}-foldlive-1-${log}" }) }

  foldlive_1_log_groups = compact([for log, map in local.foldlive_1_cw_logs : lookup(map, "log_group_name", "")])

  # ------------------------------------------------------------------------------
  # Lift and Shift Cloudwatch Variables
  # ------------------------------------------------------------------------------

  #For each log map passed, add an extra kv for the log group name
  designer_cw_logs    = { for log, map in var.designer_cw_logs : log => merge(map, { "log_group_name" = "${var.application}-designer-${log}" }) }
  designer_log_groups = compact([for log, map in local.designer_cw_logs : lookup(map, "log_group_name", "")])

  #For each log map passed, add an extra kv for the log group name
  generate_cw_logs    = { for log, map in var.generate_cw_logs : log => merge(map, { "log_group_name" = "${var.application}-generate-${log}" }) }
  generate_log_groups = compact([for log, map in local.generate_cw_logs : lookup(map, "log_group_name", "")])

  #For each log map passed, add an extra kv for the log group name
  smart_vault_cw_logs    = { for log, map in var.smart_vault_cw_logs : log => merge(map, { "log_group_name" = "${var.application}-smart-vault-${log}" }) }
  smart_vault_log_groups = compact([for log, map in local.smart_vault_cw_logs : lookup(map, "log_group_name", "")])

  #For each log map passed, add an extra kv for the log group name
  chips_estor_cw_logs    = { for log, map in var.chips_estor_cw_logs : log => merge(map, { "log_group_name" = "${var.application}-chips-estor-${log}" }) }
  chips_estor_log_groups = compact([for log, map in local.chips_estor_cw_logs : lookup(map, "log_group_name", "")])

  #For each log map passed, add an extra kv for the log group name
  rempro_cw_logs    = { for log, map in var.rempro_cw_logs : log => merge(map, { "log_group_name" = "${var.application}-rempro-${log}" }) }
  rempro_log_groups = compact([for log, map in local.rempro_cw_logs : lookup(map, "log_group_name", "")])

  # ------------------------------------------------------------------------------
  # Shared Security Group Variables
  # ------------------------------------------------------------------------------
  azure_dc_cidrs = jsondecode(data.vault_generic_secret.azure_dc_cidrs.data["cidrs"])

  # ------------------------------------------------------------------------------
  # Ewok License Backup Server Security Group Variables
  # ------------------------------------------------------------------------------

  ingress_cidr_blocks_ewok_lic_bac = jsondecode(local.ewok_lic_ec2_data["ingress-cidr-blocks"])

  # ------------------------------------------------------------------------------
  # Ewok License Second Server Security Group Variables
  # ------------------------------------------------------------------------------

  ingress_cidr_blocks_ewok_lic_sec = jsondecode(local.ewok_lic_ec2_data["ingress-cidr-blocks"])

  # ------------------------------------------------------------------------------
  # ABBYY Document Capture & OCR Server Security Group Variables
  # ------------------------------------------------------------------------------

  ingress_cidr_blocks_abby_doc_ocr = jsondecode(local.abbyy_doc_ocr_ec2_data["ingress-cidr-blocks"])

  # ------------------------------------------------------------------------------
  #  Business Objects Server 1 Security Group Variables
  # ------------------------------------------------------------------------------

  ingress_cidr_blocks_bus_obj = jsondecode(local.bus_obj_1_ec2_data["ingress-cidr-blocks"])

  # ------------------------------------------------------------------------------
  #  Live Test Server 1 Security Group Variables
  # ------------------------------------------------------------------------------

  ingress_cidr_blocks_live_test = jsondecode(local.live_test_1_ec2_data["ingress-cidr-blocks"])
  
  # ------------------------------------------------------------------------------
  #  Live Test Server 2 Security Group Variables
  # ------------------------------------------------------------------------------

  ingress_cidr_blocks_live_test2 = jsondecode(local.live_test_2025_2_ec2_data["ingress-cidr-blocks"])

  # ------------------------------------------------------------------------------
  #  Live qrmad_1 Security Group Variables
  # ------------------------------------------------------------------------------

  ingress_cidr_blocks_qrmad_1 = jsondecode(local.qrmad_1_ec2_data["ingress-cidr-blocks"])


  # ------------------------------------------------------------------------------
  #  Live qdc_1 Security Group Variables
  # ------------------------------------------------------------------------------

  ingress_cidr_blocks_qdc_1 = jsondecode(local.qdc_1_ec2_data["ingress-cidr-blocks"])

  # ------------------------------------------------------------------------------
  #  Live foldlive_1 Security Group Variables
  # ------------------------------------------------------------------------------

  ingress_cidr_blocks_foldlive_1 = jsondecode(local.foldlive_1_ec2_data["ingress-cidr-blocks"])

}