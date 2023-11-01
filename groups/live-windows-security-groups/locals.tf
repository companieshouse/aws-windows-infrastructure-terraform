# ------------------------------------------------------------------------
# Locals
# ------------------------------------------------------------------------
locals {

  # ------------------------------------------------------------------------------
  # Shared Security Group Variables
  # ------------------------------------------------------------------------------
  azure_dc_cidrs = jsondecode(data.vault_generic_secret.azure_dc_cidrs.data["cidrs"])

  sql_cidrs = jsondecode(data.vault_generic_secret.sql_cidrs.data["sql"])
  # ------------------------------------------------------------------------------
  # Test/Dev Generate Server Security Group Variables
  # ------------------------------------------------------------------------------

  # Test Dev Generate RDP port CIDR blocks
  test_dev_generate_rdp_cidr_block = [
    "10.172.116.0/22",
    "10.172.20.0/22"
  ]

  # Test Dev Generate 49155 port CIDR blocks
  test_dev_generate_49155_cidr_block = [
    "172.16.101.82/32",
    "172.16.202.91/32"
  ]

  # Test Dev Generate 135 port CIDR blocks
  test_dev_generate_135_cidr_block = [
    "172.16.101.82/32",
    "172.16.202.91/32",
    "172.16.200.200/32"
  ]

  # Test Dev Generate 8080 port CIDR blocks
  test_dev_generate_8080_cidr_block = [
    "10.172.116.0/22",
    "10.172.20.0/22",
    "172.19.0.0/17"
  ]

  # ------------------------------------------------------------------------------
  # Production Generate Server Security Group Variables
  # ------------------------------------------------------------------------------

  # Production Generate RDP port CIDR blocks
  prod_generate_rdp_cidr_block = [
    "10.172.116.0/22",
    "10.172.20.0/22",
    "172.16.101.82/32"
  ]

  # Production Generate 49155 port CIDR blocks
  prod_generate_49155_cidr_block = [
    "172.16.101.82/32",
    "172.16.202.91/32"
  ]

  # Production Generate 135 port CIDR blocks
  prod_generate_135_cidr_block = [
    "172.16.101.82/32",
    "172.16.202.91/32",
    "172.16.200.200/32"
  ]

  # Production Generate 445 port CIDR blocks
  prod_generate_445_cidr_block = [
    "172.16.101.82/32"
  ]

  # Production Generate 139 port CIDR blocks
  prod_generate_139_cidr_block = [
    "172.16.101.82/32"
  ]

  # ------------------------------------------------------------------------------
  # Smart Vault Shared Security Group Variables
  # ------------------------------------------------------------------------------
  smart_onprem_cidrs = jsondecode(data.vault_generic_secret.smart_onprem_cidrs.data["cidrs"])

  # ------------------------------------------------------------------------------
  # Smart Vault 1 Server Security Group Variables
  # ------------------------------------------------------------------------------

  smart_vault_1_http_cidr_block = [
    "10.172.116.0/22",
    "10.172.20.0/22",
    "172.16.200.200/32",
    "172.18.0.0/16",
    "172.19.0.0/17",
    "172.23.0.0/16"
  ]

  # Smart Vault 1 135 port CIDR blocks
  smart_vault_1_135_cidr_block = [
    "172.16.202.91/32",
    "172.16.200.200/32",
    "172.16.101.82/32"
  ]

  # Smart Vault 1 445 port CIDR blocks
  smart_vault_1_445_cidr_block = [
    "10.84.11.21/32",
    "172.16.101.82/32",
    "172.16.200.206/32"
  ]

  # Smart Vault 1 rdp port CIDR blocks
  smart_vault_1_rdp_cidr_block = [
    "10.172.20.0/22"
  ]

  # Smart Vault 1 8080 port CIDR blocks
  smart_vault_1_8080_cidr_block = [
    "10.172.20.0/22",
    "10.172.116.0/22"
  ]

  # Smart Vault 1 49155 port CIDR blocks
  smart_vault_1_49155_cidr_block = [
    "172.16.202.91/32",
    "172.16.101.82/32"
  ]

  # ------------------------------------------------------------------------------
  # Smart Vault 2 Server Security Group Variables
  # ------------------------------------------------------------------------------

  # Smart Vault 2 135 port CIDR blocks
  smart_vault_2_135_cidr_block = [
    "172.16.101.82/32",
    "172.16.202.91/32",
    "172.16.200.200/32"
  ]

  # Smart Vault 2 445 port CIDR blocks
  smart_vault_2_445_cidr_block = [
    "10.84.11.21/32",
    "172.16.101.82/32",
    "172.16.200.206/32"
  ]

  # Smart Vault 2 rdp port CIDR blocks
  smart_vault_2_rdp_cidr_block = [
    "10.172.20.0/22",
    "172.16.101.82/32"
  ]

  # Smart Vault 2 49155 port CIDR blocks
  smart_vault_2_49155_cidr_block = [
    "172.16.101.82/32",
    "172.16.202.91/32"
  ]

  # ------------------------------------------------------------------------------
  # Designer Application Server Security Group Variables
  # ------------------------------------------------------------------------------

  # Designer Application 135 port CIDR blocks
  designer_135_cidr_block = [
    "172.16.202.91/32",
    "172.16.200.200/32",
    "172.16.101.82/32"
  ]

  # Designer Application MSSQL port CIDR blocks
  designer_mssql_cidr_block = [
    "172.16.155.6/32",
    "172.16.155.9/32"
  ]

  # Designer Application rdp port CIDR blocks
  designer_rdp_cidr_block = [
    "172.16.101.82/32",
    "10.172.20.0/22"
  ]

  # Designer Application 37719 port CIDR blocks
  designer_37719_cidr_block = [
    "10.172.116.0/22",
    "10.172.20.0/22"
  ]

  # Designer Application 49155 port CIDR blocks
  designer_49155_cidr_block = [
    "172.16.202.91/32",
    "172.16.101.82/32"
  ]

  # Designer Application 445 port CIDR blocks
  designer_445_cidr_block = [
    "10.172.116.0/22",
    "172.16.101.82/32",
    "10.172.20.0/22"
  ]

  # Designer Application 139 port CIDR blocks
  designer_139_cidr_block = [
    "10.172.116.0/22",
    "10.172.20.0/22"
  ]

  # ------------------------------------------------------------------------------
  # Chips Estor Server Security Group Variables
  # ------------------------------------------------------------------------------

  # Chips Estor 135 port CIDR blocks
  chips_135_cidr_block = [
    "172.16.101.82/32",
    "172.16.202.91/32",
    "172.16.200.200/32"
  ]

  # Chips Estor 139 port CIDR blocks
  chips_139_cidr_block = [
    "10.172.116.0/22",
    "10.172.20.0/22",
    "172.16.101.82/32",
    "172.19.0.0/16",
    "10.172.24.160/29"
  ]

  # Chips Estor 445 port CIDR blocks
  chips_445_cidr_block = [
    "10.172.116.0/22",
    "10.172.20.0/22",
    "172.16.101.82/32",
    "172.19.0.0/16",
    "10.172.24.160/29"
  ]

  # Chips Estor 53971 port CIDR blocks
  chips_53971_cidr_block = [
    "172.16.202.91/32",
    "172.16.101.82/32"
  ]

  # Chips Estor 55792 port CIDR blocks
  chips_55792_cidr_block = [
    "172.16.101.82/32",
    "172.16.202.91/32"
  ]

  # Chips Estor 8080 port CIDR blocks
  chips_8080_cidr_block = [
    "10.172.20.0/22",
    "10.172.116.0/22",
    "172.19.0.0/17",
    "10.172.120.0/24",
    "172.16.200.0/22"
  ]


  # ------------------------------------------------------------------------------
  # Remittance Processor (Rempro) Server - Security Group Variables
  # ------------------------------------------------------------------------------

  # Rempro 80 port CIDR blocks
  rempro_http_cidr_block = [
    "10.172.116.0/22",
    "10.172.20.0/22",
    "172.19.0.0/17"
  ]

  # Rempro 135 port CIDR blocks
  rempro_135_cidr_block = [
    "10.128.247.5/32",
    "172.16.101.82/32",
    "172.18.0.0/16",
    "172.19.0.0/17",
    "172.23.0.0/16"
  ]

  # Rempro 445 port CIDR blocks
  rempro_445_cidr_block = [
    "10.172.116.0/22",
    "10.172.20.0/22",
    "172.18.0.0/16",
    "172.19.0.0/17"
  ]

  # Rempro 139 port CIDR blocks
  rempro_139_cidr_block = [
    "10.172.116.0/22",
    "10.172.20.0/22",
    "172.18.0.0/16",
    "172.19.0.0/17"
  ]

  # Rempro 49155 port CIDR blocks
  rempro_49155_cidr_block = [
    "172.16.101.82/32",
    "10.128.247.5/32"
  ]

  # Rempro rpc port CIDR blocks
  rempro_rpc_cidr_block = [
    "172.23.0.0/16",
    "172.18.0.0/16",
    "172.19.0.0/17"
  ]
}
