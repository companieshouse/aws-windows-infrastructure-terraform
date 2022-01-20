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
  # Ewok License Backup Server Security Group Variables
  # ------------------------------------------------------------------------------

  # Ewok License Backup Server 80 port CIDR blocks
  ewok_lic_bac_80_cidr_block = [
    "172.18.0.0/24",
    "172.19.0.0/18",
    "172.23.32.16/32"
  ]

  # Ewok License Backup Server 135 port CIDR blocks
  ewok_lic_bac_135_cidr_block = [
    "172.16.202.91/32",
    "172.16.101.82/32"
  ]

  # Ewok License Backup Server 445 port CIDR blocks
  ewok_lic_bac_445_cidr_block = [
    "10.172.0.0/19",
    "172.16.101.82/32",
    "172.19.0.0/17",
    "172.23.32.16/32"
  ]

  # Ewok License Backup Server winrm port CIDR blocks
  ewok_lic_bac_winrm_cidr_block = [
    "172.16.200.200/32",
    "172.16.155.9/32"
  ]

  # Ewok License Backup Server 49155 port CIDR blocks
  ewok_lic_bac_49155_cidr_block = [
    "172.16.101.82/32",
    "172.16.202.91/32"
  ]

  # Ewok License Backup Server rdp port CIDR blocks
  # ewok_lic_bac_third_party_rdp_cidr_block = [
  #]


  # ------------------------------------------------------------------------------
  # Ewok License Second Server Security Group Variables
  # ------------------------------------------------------------------------------

  # Ewok License Second 135 port CIDR blocks
  ewok_lic_sec_135_cidr_block = [
    "172.16.202.91/32",
    "172.16.101.82/32",
    "172.16.200.200/32"
  ]

  # Ewok License Second 49155 port CIDR blocks
  ewok_lic_sec_49155_cidr_block = [
    "172.16.101.82/32",
    "172.16.202.91/32"
  ]

  # Ewok License Second Third Party rdp port CIDR blocks
  # ewok_lic_sec_third_party_rdp_cidr_block = [
  #]

  # ------------------------------------------------------------------------------
  # ABBYY Document Capture & OCR Server Security Group Variables
  # ------------------------------------------------------------------------------

  # ABBYY Document Capture & OCR 135 port CIDR blocks
  abbyy_doc_ocr_135_cidr_block = [
    "172.16.202.91/32",
    "172.16.101.82/32"
  ]

  # ABBYY Document Capture & OCR rdp port CIDR blocks
  abbyy_doc_ocr_rdp_cidr_block = [
    "172.16.101.82/32",
    "10.172.23.145/32"
  ]

  # ABBYY Document Capture & OCR 49155 rdp port CIDR blocks
  abbyy_doc_ocr_49155_cidr_block = [
    "172.16.101.82/32",
    "172.16.202.91/32"
  ]

  # ABBYY Document Capture & OCR Third Party rdp port CIDR blocks
  # abbyy_doc_ocr_third_party_rdp_cidr_block = [
  #]
}
