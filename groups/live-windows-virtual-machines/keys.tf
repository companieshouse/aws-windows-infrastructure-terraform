# ------------------------------------------------------------------------------
# Key Pair
# ------------------------------------------------------------------------------
resource "aws_key_pair" "ewok_lic_bac_keypair" {
  key_name   = "Ewok-License-Backup-Server"
  public_key = local.ewok_lic_bac_ec2_data["public-key"]
}

resource "aws_key_pair" "ewok_lic_sec_keypair" {
  key_name   = "Ewok-License-Second-Server"
  public_key = local.ewok_lic_sec_ec2_data["public-key"]
}

resource "aws_key_pair" "abbyy_doc_ocr_keypair" {
  key_name   = "Abbyy-Doc-Capture-OCR-Server"
  public_key = local.ewok_lic_sec_ec2_data["public-key"]
}
