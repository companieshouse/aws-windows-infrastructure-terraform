# ------------------------------------------------------------------------
# Locals
# ------------------------------------------------------------------------
locals {

  # ------------------------------------------------------------------------------
  # Test/Dev Generate Server Security Group Variables
  # ------------------------------------------------------------------------------

  # Test Dev Generate RDP port CIDR blocks
  test_dev_generate_rdp_cidr_block = [
    "10.172.116.224/32",
    "10.172.23.39/32"
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

  # ------------------------------------------------------------------------------
  # Production Generate Server Security Group Variables
  # ------------------------------------------------------------------------------

  # Production Generate RDP port CIDR blocks
  prod_generate_rdp_cidr_block = [
    "10.172.116.0/24",
    "10.172.119.76/32",
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

  # ------------------------------------------------------------------------------
  # Smart Vault 1 Server Security Group Variables
  # ------------------------------------------------------------------------------

  smart_vault_1_http_cidr_block = [
    "10.172.116.0/22",
    "10.172.20.0/22",
    "172.16.200.200/32",
    "172.18.96.13/32",
    "172.19.28.13/32",
    "172.19.68.0/24",
    "172.23.0.15/32"
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
    "10.172.23.198/32",
    "10.172.23.39/32"
  ]

  # Smart Vault 1 8080 port CIDR blocks
  smart_vault_1_8080_cidr_block = [
    "10.172.23.39/32",
    "10.172.116.25/32"
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
    "10.172.23.198/32",
    "10.172.23.39/32",
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
    "10.172.22.130/32"
  ]

  # Designer Application 37719 port CIDR blocks
  designer_37719_cidr_block = [
    "10.172.116.194/32",
    "10.172.116.192/32",
    "10.172.20.214/32",
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
  # Chips Server Security Group Variables
  # ------------------------------------------------------------------------------

  # Chips 135 port CIDR blocks
  chips_135_cidr_block = [
    "172.16.202.91/32",
    "172.16.200.200/32",
    "172.16.101.82/32"
  ]

  # Chips 445 port CIDR blocks
  chips_445_cidr_block = [
    "10.172.116.0/22",
    "10.172.20.0/22",
    "172.16.101.82/32",
    "172.19.0.0/16"
  ]

  # Chips 53971 port CIDR blocks
  chips_53971_cidr_block = [
    "172.16.202.91/32",
    "172.16.101.82/32"
  ]

  # Chips 55792 port CIDR blocks
  chips_55792_cidr_block = [
    "172.16.101.82/32",
    "172.16.202.91/32"
  ]

  # Chips 8080 port CIDR blocks
  chips_8080_cidr_block = [
    "10.172.117.0/32",
    "10.172.120.0/24",
    "10.172.20.0/24",
    "172.16.200.0/22",
    "172.19.32.0/23",
    "172.19.68.0/24"
  ]
}
