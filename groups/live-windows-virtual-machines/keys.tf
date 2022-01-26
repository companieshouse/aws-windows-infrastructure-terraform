# ------------------------------------------------------------------------------
# Key Pair
# ------------------------------------------------------------------------------
resource "aws_key_pair" "ewok_lic_keypair" {
  key_name   = "Ewok-License-Backup-Server"
  public_key = local.ewok_lic_ec2_data["public-key"]
}

resource "aws_key_pair" "abbyy_doc_ocr_keypair" {
  key_name   = "Abbyy-Doc-Capture-OCR-Server"
  public_key = local.abbyy_doc_ocr_ec2_data["public-key"]
}

resource "aws_key_pair" "bus_obj_1_keypair" {
  key_name   = "Business-Objects-Server-1"
  public_key = local.bus_obj_1_ec2_data["public-key"]
}