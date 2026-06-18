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

resource "aws_key_pair" "live_test_1_keypair" {
  key_name   = "Live-Test-Server-1"
  public_key = local.live_test_1_ec2_data["public-key"]
}

resource "aws_key_pair" "live_test_2025_2_keypair" {
  key_name   = "Live-Test-Server-2"
  public_key = local.live_test_2025_2_ec2_data["public-key"]
}

resource "aws_key_pair" "qrmad_1_keypair" {
  key_name   = "qrmad-1"
  public_key = local.qrmad_1_ec2_data["public-key"]
}

resource "aws_key_pair" "qdc_1_keypair" {
  key_name   = "qdc-1"
  public_key = local.qdc_1_ec2_data["public-key"]
}
resource "aws_key_pair" "foldlive_1_keypair" {
  key_name   = "foldlive-1"
  public_key = local.foldlive_1_ec2_data["public-key"]
}

resource "aws_key_pair" "smartv_1_keypair" {
  key_name   = "smartv-1"
  public_key = local.smartv_1_ec2_data["public-key"]
}

resource "aws_key_pair" "smartv_2_keypair" {
  key_name   = "smartv-2"
  public_key = local.smartv_2_ec2_data["public-key"]
}

resource "aws_key_pair" "doc1da_keypair" {
  key_name   = "doc1da"
  public_key = local.doc1da_ec2_data["public-key"]
}

resource "aws_key_pair" "doc1pg_keypair" {
  key_name   = "doc1pg"
  public_key = local.doc1pg_ec2_data["public-key"]
}

resource "aws_key_pair" "doc1tdg_keypair" {
  key_name   = "doc1tdg"
  public_key = local.doc1tdg_ec2_data["public-key"]
}