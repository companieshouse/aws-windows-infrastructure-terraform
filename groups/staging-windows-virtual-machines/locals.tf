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

  # ------------------------------------------------------------------------------
  # ABBYY Development Server Security Group Variables
  # ------------------------------------------------------------------------------

  # ABBYY Dev 135 port CIDR blocks
  abbyy_dev_135_cidr_block = [
    "172.16.202.91/32",
    "172.16.101.82/32"
  ]

  # ABBYY Dev 49155 port CIDR blocks
  abbyy_dev_49155_cidr_block = [
    "172.16.202.91/32",
    "172.16.101.82/32"
  ]

  # ABBYY Dev Third Party rdp port CIDR blocks
  #abbyy_dev_third_party_rdp_cidr_block = [
  #]


  # ------------------------------------------------------------------------------
  # Document Simulation Test Server Security Group Variables
  # ------------------------------------------------------------------------------

  # Document Simulation Test 135 port CIDR blocks
  doc_sim_135_cidr_block = [
    "172.16.202.91/32",
    "172.16.101.82/32"
  ]

  # Document Simulation Test winrm http port CIDR blocks
  doc_sim_winrm_http_cidr_block = [
    "172.16.200.200/32",
    "172.16.155.9/32"
  ]

  # Document Simulation Test 49155 port CIDR blocks
  doc_sim_49155_cidr_block = [
    "172.16.101.82/32",
    "172.16.202.91/32"
  ]

  #  Document Simulation Test Third Party rdp port CIDR blocks
  #doc_sim_third_party_rdp_cidr_block = [
  #]

  # ------------------------------------------------------------------------------
  # Business Objects Server 2 Security Group Variables
  # ------------------------------------------------------------------------------

  # Business Objects server 2 135 port CIDR blocks
  bus_obj_2_135_cidr_block = [
    "172.16.202.91/32",
    "172.16.101.82/32"
  ]

  # Business Objects server 2 rdp port CIDR blocks
  bus_obj_2_rdp_cidr_block = [
    "172.16.101.82/32",
    "10.172.120.168/29",
    "10.172.24.168/29"
  ]

  # Business Objects 49155 port CIDR blocks
  bus_obj_2_49155_cidr_block = [
    "172.16.101.82/32",
    "172.16.202.91/32"
  ]
}
