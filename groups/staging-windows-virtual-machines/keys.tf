# ------------------------------------------------------------------------------
# Key Pair
# ------------------------------------------------------------------------------
resource "aws_key_pair" "abbyy_dev_keypair" {
  key_name   = "ABBYY-Development-Server"
  public_key = local.abbyy_dev_ec2_data["public-key"]
}

resource "aws_key_pair" "doc_sim_keypair" {
  key_name   = "Document-Simulation-Test-Server"
  public_key = local.doc_sim_ec2_data["public-key"]
}

resource "aws_key_pair" "bus_obj_2_keypair" {
  key_name   = "Business-Objects-Server-2"
  public_key = local.bus_obj_2_ec2_data["public-key"]
}