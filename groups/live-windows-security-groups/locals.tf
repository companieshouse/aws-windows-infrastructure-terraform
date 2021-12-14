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
  # Smart Vault 1 Server Security Group Variables
  # ------------------------------------------------------------------------------

  smart_vault_1_http_cidr_block = [
    "10.172.116.0/24",
    "10.172.117.0/24",
    "10.172.118.0/24",
    "10.172.119.0/24",
    "10.172.20.0/24",
    "10.172.21.0/24",
    "10.172.22.0/24",
    "10.172.23.0/24",
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
    "172.16.200.206/32",
    "172.16.101.82/32"
  ]

  # Smart Vault 1 rdp port CIDR blocks
  smart_vault_1_rdp_cidr_block = [
    "10.172.23.198/32",
    "10.172.23.39/32"
  ]

  # Smart Vault 1 6001 port CIDR blocks
  smart_vault_1_6001_cidr_block = [
    "172.16.200.92/32",
    "172.16.200.91/32"
  ]

  # Smart Vault 1 6003 port CIDR blocks
  smart_vault_1_6003_cidr_block = [
    "172.16.200.91/32",
    "172.16.200.92/32"
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
    "172.16.200.206/32",
    "172.16.101.82/32",
    "172.16.200.91/32"
  ]

  # Smart Vault 2 rdp port CIDR blocks
  smart_vault_2_rdp_cidr_block = [
    "10.172.23.198/32",
    "10.172.23.39/32",
    "172.16.101.82/32"
  ]

  # Smart Vault 2 6001 port CIDR blocks
  smart_vault_2_6001_cidr_block = [
    "172.16.200.91/32",
    "172.16.200.92/32"
  ]

  # Smart Vault 2 49155 port CIDR blocks
  smart_vault_2_49155_cidr_block = [
    "172.16.101.82/32",
    "172.16.202.91/32"
  ]
}