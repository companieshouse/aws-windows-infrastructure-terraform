# ------------------------------------------------------------------------
# Locals
# ------------------------------------------------------------------------
locals {

vcenter_cidr_block = jsondecode(data.vault_generic_secret.vcenter_data.data["cidrs"])

}
