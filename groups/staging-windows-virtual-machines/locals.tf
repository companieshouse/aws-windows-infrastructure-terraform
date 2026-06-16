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
  # ABBYY Development Server locals
  # ------------------------------------------------------------------------------

  abbyy_dev_ec2_data = data.vault_generic_secret.abbyy_dev_ec2_data.data

  #For each log map passed, add an extra kv for the log group name
  abbyy_dev_cw_logs = { for log, map in var.abbyy_dev_cw_logs : log => merge(map, { "log_group_name" = "${var.application}-abbyy-dev-${log}" }) }

  abbyy_dev_log_groups = compact([for log, map in local.abbyy_dev_cw_logs : lookup(map, "log_group_name", "")])


  # ------------------------------------------------------------------------------
  # Document Simulation Test Server locals
  # ------------------------------------------------------------------------------

  doc_sim_ec2_data = data.vault_generic_secret.doc_sim_ec2_data.data

  #For each log map passed, add an extra kv for the log group name
  doc_sim_cw_logs = { for log, map in var.doc_sim_cw_logs : log => merge(map, { "log_group_name" = "${var.application}-doc-sim-test-${log}" }) }

  doc_sim_log_groups = compact([for log, map in local.doc_sim_cw_logs : lookup(map, "log_group_name", "")])

  # ------------------------------------------------------------------------------
  # Business Objects Server 2 locals
  # ------------------------------------------------------------------------------

  bus_obj_2_ec2_data = data.vault_generic_secret.bus_obj_2_ec2_data.data

  #For each log map passed, add an extra kv for the log group name
  bus_obj_2_cw_logs = { for log, map in var.bus_obj_2_cw_logs : log => merge(map, { "log_group_name" = "${var.application}-bus-obj-2-${log}" }) }

  bus_obj_2_log_groups = compact([for log, map in local.bus_obj_2_cw_logs : lookup(map, "log_group_name", "")])

  bus_obj_2_volume_snapshot_ids = jsondecode(local.bus_obj_2_ec2_data["volume_snapshot_ids"])
  bus_obj_2_xvdf_snapshot_id    = lookup(local.bus_obj_2_volume_snapshot_ids, "xvdf", null)
  bus_obj_2_xvdg_snapshot_id    = lookup(local.bus_obj_2_volume_snapshot_ids, "xvdg", null)
  bus_obj_2_xvdh_snapshot_id    = lookup(local.bus_obj_2_volume_snapshot_ids, "xvdh", null)

 # ------------------------------------------------------------------------------
  # Test Server Server 1 locals
  # ------------------------------------------------------------------------------

  test_2019_1_ec2_data = data.vault_generic_secret.test_2019_1_ec2_data.data

  #For each log map passed, add an extra kv for the log group name
  test_2019_1_cw_logs = { for log, map in var.test_2019_1_cw_logs : log => merge(map, { "log_group_name" = "${var.application}-test-2019-1-${log}" }) }

  test_2019_1_log_groups = compact([for log, map in local.test_2019_1_cw_logs : lookup(map, "log_group_name", "")])


 # ------------------------------------------------------------------------------
  # Test Server Server 2 locals
  # ------------------------------------------------------------------------------

  test_2019_2_ec2_data = data.vault_generic_secret.test_2019_2_ec2_data.data

  #For each log map passed, add an extra kv for the log group name
  test_2019_2_cw_logs = { for log, map in var.test_2019_2_cw_logs : log => merge(map, { "log_group_name" = "${var.application}-test-2019-2-${log}" }) }

  test_2019_2_log_groups = compact([for log, map in local.test_2019_2_cw_logs : lookup(map, "log_group_name", "")])

# ------------------------------------------------------------------------------
  # Test Server Server 3 locals
  # ------------------------------------------------------------------------------

  test_2025_1_ec2_data = data.vault_generic_secret.test_2025_1_ec2_data.data

  #For each log map passed, add an extra kv for the log group name
  test_2025_1_cw_logs = { for log, map in var.test_2025_1_cw_logs : log => merge(map, { "log_group_name" = "${var.application}-test-2025-1-${log}" }) }

  test_2025_1_log_groups = compact([for log, map in local.test_2025_1_cw_logs : lookup(map, "log_group_name", "")])



  # ------------------------------------------------------------------------------
  # Shared Security Group Variables
  # ------------------------------------------------------------------------------
  azure_dc_cidrs = jsondecode(data.vault_generic_secret.azure_dc_cidrs.data["cidrs"])

  # ------------------------------------------------------------------------------
  # ABBYY Development Server Security Group Variables
  # ------------------------------------------------------------------------------

  ingress_cidr_blocks_abby_dev = jsondecode(local.abbyy_dev_ec2_data["ingress-cidr-blocks"])
  

  # ------------------------------------------------------------------------------
  # Document Simulation Test Server Security Group Variables
  # ------------------------------------------------------------------------------

  ingress_cidr_blocks_doc_sim = jsondecode(local.doc_sim_ec2_data["ingress-cidr-blocks"])

  # ------------------------------------------------------------------------------
  # Business Objects Server 2 Security Group Variables
  # ------------------------------------------------------------------------------

  ingress_cidr_blocks_bus_obj = jsondecode(local.bus_obj_2_ec2_data["ingress-cidr-blocks"])
  

  # ------------------------------------------------------------------------------
  # Test 2019 Server 1 Security Group Variables
  # ------------------------------------------------------------------------------

  ingress_cidr_blocks_test_ec2 = jsondecode(local.test_2019_1_ec2_data["ingress-cidr-blocks"])


  # ------------------------------------------------------------------------------
  # Test 2019 Server 2 Security Group Variables
  # ------------------------------------------------------------------------------

  ingress_cidr_blocks_test2_ec2 = jsondecode(local.test_2019_2_ec2_data["ingress-cidr-blocks"])

  # ------------------------------------------------------------------------------
  # Test 2025 Server 1 Security Group Variables
  # ------------------------------------------------------------------------------

  ingress_cidr_blocks_test3_ec2 = jsondecode(local.test_2025_1_ec2_data["ingress-cidr-blocks"])

  # ------------------------------------------------------------------------------
  # Folding Space Server 1 Security Group Variables
  # ------------------------------------------------------------------------------

  ingress_cidr_blocks_foldstage1_ec2 = jsondecode(local.foldstage_1_ec2_data["ingress-cidr-blocks"])

}
