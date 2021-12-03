# ------------------------------------------------------------------------------
# Vault Variables
# ------------------------------------------------------------------------------
variable "vault_username" {
  type        = string
  description = "Username for connecting to Vault - usually supplied through TF_VARS"
}

variable "vault_password" {
  type        = string
  description = "Password for connecting to Vault - usually supplied through TF_VARS"
}

# ------------------------------------------------------------------------------
# AWS Variables
# ------------------------------------------------------------------------------
variable "aws_region" {
  type        = string
  description = "The AWS region in which resources will be administered"
}

variable "aws_profile" {
  type        = string
  description = "The AWS profile to use"
}

variable "aws_account" {
  type        = string
  description = "The name of the AWS Account in which resources will be administered"
}

# ------------------------------------------------------------------------------
# AWS Variables - Shorthand
# ------------------------------------------------------------------------------

variable "account" {
  type        = string
  description = "Short version of the name of the AWS Account in which resources will be administered"
}

variable "region" {
  type        = string
  description = "Short version of the name of the AWS region in which resources will be administered"
}

# ------------------------------------------------------------------------------
# Environment Variables
# ------------------------------------------------------------------------------

variable "application" {
  type        = string
  description = "The name of the application"
}

variable "environment" {
  type        = string
  description = "The name of the environment"
}

# ------------------------------------------------------------------------------
# Security Group Variables
# ------------------------------------------------------------------------------

variable "test_dev_generate_rdp_cidr_block" {
  type        = list(any)
  description = "Test Dev Generate RDP port CIDR blocks"
  default     = []
}

variable "test_dev_generate_49155_cidr_block" {
  type        = list(any)
  description = "Test Dev Generate 49155 port CIDR blocks"
  default     = []
}

variable "test_dev_generate_135_cidr_block" {
  type        = list(any)
  description = "Test Dev Generate 135 port CIDR blocks"
  default     = []
}