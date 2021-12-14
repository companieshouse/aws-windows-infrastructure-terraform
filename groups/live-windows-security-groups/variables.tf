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
# Test/Dev Generate Server Security Group Variables
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

# ------------------------------------------------------------------------------
# Smart Vault 1 Server Security Group Variables
# ------------------------------------------------------------------------------

variable "smart_vault_1_http_cidr_block" {
  type        = list(any)
  description = "Smart Vault 1 http port CIDR blocks"
  default     = []
}

variable "smart_vault_1_135_cidr_block" {
  type        = list(any)
  description = "Smart Vault 1 135 port CIDR blocks"
  default     = []
}

variable "smart_vault_1_445_cidr_block" {
  type        = list(any)
  description = "Smart Vault 1 445 port CIDR blocks"
  default     = []
}

variable "smart_vault_1_rdp_cidr_block" {
  type        = list(any)
  description = "Smart Vault 1 rdp port CIDR blocks"
  default     = []
}

variable "smart_vault_1_6001_cidr_block" {
  type        = list(any)
  description = "Smart Vault 1 6001 port CIDR blocks"
  default     = []
}

variable "smart_vault_1_6003_cidr_block" {
  type        = list(any)
  description = "Smart Vault 1 6003 port CIDR blocks"
  default     = []
}

variable "smart_vault_1_8080_cidr_block" {
  type        = list(any)
  description = "Smart Vault 1 8080 port CIDR blocks"
  default     = []
}

variable "smart_vault_1_49155_cidr_block" {
  type        = list(any)
  description = "Smart Vault 1 49155 port CIDR blocks"
  default     = []
}

# ------------------------------------------------------------------------------
# Smart Vault 2 Server Security Group Variables
# ------------------------------------------------------------------------------

variable "smart_vault_2_135_cidr_block" {
  type        = list(any)
  description = "Smart Vault 2 135 port CIDR blocks"
  default     = []
}

variable "smart_vault_2_445_cidr_block" {
  type        = list(any)
  description = "Smart Vault 2 445 port CIDR blocks"
  default     = []
}

variable "smart_vault_2_6001_cidr_block" {
  type        = list(any)
  description = "Smart Vault 2 6001 port CIDR blocks"
  default     = []
}

variable "smart_vault_2_49155_cidr_block" {
  type        = list(any)
  description = "Smart Vault 2 49155 port CIDR blocks"
  default     = []
}

variable "smart_vault_2_rdp_cidr_block" {
  type        = list(any)
  description = "Smart Vault 2 rdp port CIDR blocks"
  default     = []
}