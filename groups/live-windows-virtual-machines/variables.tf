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
variable "environment" {
  type        = string
  description = "The name of the environment"
}

variable "application" {
  type        = string
  description = "The name of the application"
}

variable "ServiceTeam" {
  type        = string
  description = "The service team that supports the application"
  default     = "windows-support"
}

variable "default_log_group_retention_in_days" {
  type        = number
  default     = 365
  description = "Total days to retain logs in CloudWatch log group if not specified for specific logs"
}

# ------------------------------------------------------------------------------
# EC2 Variables
# ------------------------------------------------------------------------------

variable "get_password_data" {
  description = "If true, wait for password data to become available and retrieve it."
  type        = bool
  default     = false
}

variable "monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  type        = bool
  default     = false
}

# ------------------------------------------------------------------------------
# EBS Variables
# ------------------------------------------------------------------------------

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  type        = bool
  default     = true
}

variable "delete_on_termination" {
  type        = string
  default     = "false"
  description = "EBS delete on termination"
}

variable "ebs_encrypted" {
  type        = string
  default     = "true"
  description = "EBS encrypted"
}

variable "volume_type" {
  type        = string
  default     = "gp3"
  description = "EBS volume type"
}

# ------------------------------------------------------------------------------
# Ewok License Backup Server Variables
# ------------------------------------------------------------------------------

variable "ewok_lic_bac_application" {
  description = "EC2 application description"
  type        = string
}

variable "ewok_lic_bac_ec2_name" {
  description = "EC2 instance name"
  type        = string
}

variable "ewok_lic_bac_ec2_instance_size" {
  type        = string
  description = "The size of the EC2 instance"
}

variable "ewok_lic_bac_ami" {
  type        = string
  description = "ID of the AMI to use for instance"
}

variable "ewok_lic_bac_cw_logs" {
  type        = map(any)
  description = "Map of log file information; used to create log groups, IAM permissions and passed to the application to configure remote logging"
  default     = {}
}

# ------------------------------------------------------------------------------
# Ewok License Second Server Variables
# ------------------------------------------------------------------------------

variable "ewok_lic_sec_application" {
  description = "EC2 application description"
  type        = string
}

variable "ewok_lic_sec_ec2_name" {
  description = "EC2 instance name"
  type        = string
}

variable "ewok_lic_sec_ec2_instance_size" {
  type        = string
  description = "The size of the EC2 instance"
}

variable "ewok_lic_sec_ami" {
  type        = string
  description = "ID of the AMI to use for instance"
}

variable "ewok_lic_sec_cw_logs" {
  type        = map(any)
  description = "Map of log file information; used to create log groups, IAM permissions and passed to the application to configure remote logging"
  default     = {}
}

# ------------------------------------------------------------------------------
# ABBYY Document Capture & OCR Server Variables
# ------------------------------------------------------------------------------
variable "abbyy_doc_ocr_ec2_count" {
  description = "Number of instances"
  type        = number
}

variable "abbyy_doc_ocr_application" {
  description = "EC2 application description"
  type        = string
}

variable "abbyy_doc_ocr_ec2_name" {
  description = "EC2 instance name"
  type        = string
}

variable "abbyy_doc_ocr_ec2_instance_size" {
  type        = string
  description = "The size of the EC2 instance"
}

variable "abbyy_doc_ocr_ami" {
  type        = string
  description = "ID of the AMI to use for instance"
}

variable "abbyy_doc_ocr_cw_logs" {
  type        = map(any)
  description = "Map of log file information; used to create log groups, IAM permissions and passed to the application to configure remote logging"
  default     = {}
}

# ------------------------------------------------------------------------------
# Lift and Shift Cloudwatch Variables
# ------------------------------------------------------------------------------

variable "designer_cw_logs" {
  type        = map(any)
  description = "Map of log file information; used to create log groups, IAM permissions and passed to the application to configure remote logging"
  default     = {}
}

variable "generate_cw_logs" {
  type        = map(any)
  description = "Map of log file information; used to create log groups, IAM permissions and passed to the application to configure remote logging"
  default     = {}
}

variable "smart_vault_cw_logs" {
  type        = map(any)
  description = "Map of log file information; used to create log groups, IAM permissions and passed to the application to configure remote logging"
  default     = {}
}

variable "chips_estor_cw_logs" {
  type        = map(any)
  description = "Map of log file information; used to create log groups, IAM permissions and passed to the application to configure remote logging"
  default     = {}
}

variable "rempro_cw_logs" {
  type        = map(any)
  description = "Map of log file information; used to create log groups, IAM permissions and passed to the application to configure remote logging"
  default     = {}
}

# ------------------------------------------------------------------------------
# Business Objects Server 1 Variables
# ------------------------------------------------------------------------------

variable "bus_obj_1_application" {
  description = "EC2 application description"
  type        = string
}

variable "bus_obj_1_ec2_name" {
  description = "EC2 instance name"
  type        = string
}

variable "bus_obj_1_ec2_instance_size" {
  type        = string
  description = "The size of the EC2 instance"
}

variable "bus_obj_1_ami" {
  type        = string
  description = "ID of the AMI to use for instance"
}

variable "bus_obj_1_cw_logs" {
  type        = map(any)
  description = "Map of log file information; used to create log groups, IAM permissions and passed to the application to configure remote logging"
  default     = {}
}