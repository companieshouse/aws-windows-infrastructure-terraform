# aws-windows-infrastructure-terraform

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0, < 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 0.3, < 4.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >= 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 0.3, < 4.0 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | >= 2.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_abbyy_dev_ec2"></a> [abbyy\_dev\_ec2](#module\_abbyy\_dev\_ec2) | terraform-aws-modules/ec2-instance/aws | 2.19.0 |
| <a name="module_abbyy_dev_ec2_security_group"></a> [abbyy\_dev\_ec2\_security\_group](#module\_abbyy\_dev\_ec2\_security\_group) | terraform-aws-modules/security-group/aws | ~> 3.0 |
| <a name="module_abbyy_dev_profile"></a> [abbyy\_dev\_profile](#module\_abbyy\_dev\_profile) | git@github.com:companieshouse/terraform-modules//aws/instance_profile?ref=tags/1.0.59 |  |
| <a name="module_bus_obj_2_ec2"></a> [bus\_obj\_2\_ec2](#module\_bus\_obj\_2\_ec2) | terraform-aws-modules/ec2-instance/aws | 2.19.0 |
| <a name="module_bus_obj_2_ec2_security_group"></a> [bus\_obj\_2\_ec2\_security\_group](#module\_bus\_obj\_2\_ec2\_security\_group) | terraform-aws-modules/security-group/aws | ~> 3.0 |
| <a name="module_bus_obj_2_profile"></a> [bus\_obj\_2\_profile](#module\_bus\_obj\_2\_profile) | git@github.com:companieshouse/terraform-modules//aws/instance_profile?ref=tags/1.0.59 |  |
| <a name="module_doc_sim_ec2"></a> [doc\_sim\_ec2](#module\_doc\_sim\_ec2) | terraform-aws-modules/ec2-instance/aws | 2.19.0 |
| <a name="module_doc_sim_ec2_security_group"></a> [doc\_sim\_ec2\_security\_group](#module\_doc\_sim\_ec2\_security\_group) | terraform-aws-modules/security-group/aws | ~> 3.0 |
| <a name="module_doc_sim_profile"></a> [doc\_sim\_profile](#module\_doc\_sim\_profile) | git@github.com:companieshouse/terraform-modules//aws/instance_profile?ref=tags/1.0.59 |  |
| <a name="module_proxy_test_ec2"></a> [proxy\_test\_ec2](#module\_proxy\_test\_ec2) | terraform-aws-modules/ec2-instance/aws | 2.19.0 |
| <a name="module_proxy_test_ec2_security_group"></a> [proxy\_test\_ec2\_security\_group](#module\_proxy\_test\_ec2\_security\_group) | terraform-aws-modules/security-group/aws | ~> 3.0 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.abbyy_dev](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.bus_obj_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.doc_sim](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_key_pair.abbyy_dev_keypair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_key_pair.bus_obj_2_keypair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_key_pair.doc_sim_keypair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_kms_key.ebs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |
| [aws_kms_key.logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |
| [aws_security_group.rdp_shared](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) | data source |
| [aws_subnet_ids.application](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [vault_generic_secret.abbyy_dev_ec2_data](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |
| [vault_generic_secret.bus_obj_2_ec2_data](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |
| [vault_generic_secret.doc_sim_ec2_data](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |
| [vault_generic_secret.kms_keys](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |
| [vault_generic_secret.security_kms_keys](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |
| [vault_generic_secret.security_s3_buckets](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ServiceTeam"></a> [ServiceTeam](#input\_ServiceTeam) | The service team that supports the application | `string` | `"windows-support"` | no |
| <a name="input_abbyy_dev_ami"></a> [abbyy\_dev\_ami](#input\_abbyy\_dev\_ami) | ID of the AMI to use for instance | `string` | n/a | yes |
| <a name="input_abbyy_dev_application"></a> [abbyy\_dev\_application](#input\_abbyy\_dev\_application) | EC2 application description | `string` | n/a | yes |
| <a name="input_abbyy_dev_cw_logs"></a> [abbyy\_dev\_cw\_logs](#input\_abbyy\_dev\_cw\_logs) | Map of log file information; used to create log groups, IAM permissions and passed to the application to configure remote logging | `map(any)` | `{}` | no |
| <a name="input_abbyy_dev_ec2_instance_size"></a> [abbyy\_dev\_ec2\_instance\_size](#input\_abbyy\_dev\_ec2\_instance\_size) | The size of the EC2 instance | `string` | n/a | yes |
| <a name="input_abbyy_dev_ec2_name"></a> [abbyy\_dev\_ec2\_name](#input\_abbyy\_dev\_ec2\_name) | EC2 instance name | `string` | n/a | yes |
| <a name="input_account"></a> [account](#input\_account) | Short version of the name of the AWS Account in which resources will be administered | `string` | n/a | yes |
| <a name="input_application"></a> [application](#input\_application) | The name of the application | `string` | n/a | yes |
| <a name="input_aws_account"></a> [aws\_account](#input\_aws\_account) | The name of the AWS Account in which resources will be administered | `string` | n/a | yes |
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | The AWS profile to use | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region in which resources will be administered | `string` | n/a | yes |
| <a name="input_bus_obj_2_ami"></a> [bus\_obj\_2\_ami](#input\_bus\_obj\_2\_ami) | ID of the AMI to use for instance | `string` | n/a | yes |
| <a name="input_bus_obj_2_application"></a> [bus\_obj\_2\_application](#input\_bus\_obj\_2\_application) | EC2 application description | `string` | n/a | yes |
| <a name="input_bus_obj_2_cw_logs"></a> [bus\_obj\_2\_cw\_logs](#input\_bus\_obj\_2\_cw\_logs) | Map of log file information; used to create log groups, IAM permissions and passed to the application to configure remote logging | `map(any)` | `{}` | no |
| <a name="input_bus_obj_2_ec2_instance_size"></a> [bus\_obj\_2\_ec2\_instance\_size](#input\_bus\_obj\_2\_ec2\_instance\_size) | The size of the EC2 instance | `string` | n/a | yes |
| <a name="input_bus_obj_2_ec2_name"></a> [bus\_obj\_2\_ec2\_name](#input\_bus\_obj\_2\_ec2\_name) | EC2 instance name | `string` | n/a | yes |
| <a name="input_default_log_group_retention_in_days"></a> [default\_log\_group\_retention\_in\_days](#input\_default\_log\_group\_retention\_in\_days) | Total days to retain logs in CloudWatch log group if not specified for specific logs | `number` | `365` | no |
| <a name="input_delete_on_termination"></a> [delete\_on\_termination](#input\_delete\_on\_termination) | EBS delete on termination | `string` | `"false"` | no |
| <a name="input_doc_sim_ami"></a> [doc\_sim\_ami](#input\_doc\_sim\_ami) | ID of the AMI to use for instance | `string` | n/a | yes |
| <a name="input_doc_sim_application"></a> [doc\_sim\_application](#input\_doc\_sim\_application) | EC2 application description | `string` | n/a | yes |
| <a name="input_doc_sim_cw_logs"></a> [doc\_sim\_cw\_logs](#input\_doc\_sim\_cw\_logs) | Map of log file information; used to create log groups, IAM permissions and passed to the application to configure remote logging | `map(any)` | `{}` | no |
| <a name="input_doc_sim_ec2_instance_size"></a> [doc\_sim\_ec2\_instance\_size](#input\_doc\_sim\_ec2\_instance\_size) | The size of the EC2 instance | `string` | n/a | yes |
| <a name="input_doc_sim_ec2_name"></a> [doc\_sim\_ec2\_name](#input\_doc\_sim\_ec2\_name) | EC2 instance name | `string` | n/a | yes |
| <a name="input_ebs_encrypted"></a> [ebs\_encrypted](#input\_ebs\_encrypted) | EBS encrypted | `string` | `"true"` | no |
| <a name="input_ebs_optimized"></a> [ebs\_optimized](#input\_ebs\_optimized) | If true, the launched EC2 instance will be EBS-optimized | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The name of the environment | `string` | n/a | yes |
| <a name="input_get_password_data"></a> [get\_password\_data](#input\_get\_password\_data) | If true, wait for password data to become available and retrieve it. | `bool` | `false` | no |
| <a name="input_monitoring"></a> [monitoring](#input\_monitoring) | If true, the launched EC2 instance will have detailed monitoring enabled | `bool` | `false` | no |
| <a name="input_proxy_test_ami"></a> [proxy\_test\_ami](#input\_proxy\_test\_ami) | ID of the AMI to use for instance | `string` | n/a | yes |
| <a name="input_proxy_test_application"></a> [proxy\_test\_application](#input\_proxy\_test\_application) | EC2 application description | `string` | n/a | yes |
| <a name="input_proxy_test_ec2_instance_size"></a> [proxy\_test\_ec2\_instance\_size](#input\_proxy\_test\_ec2\_instance\_size) | The size of the EC2 instance | `string` | n/a | yes |
| <a name="input_proxy_test_ec2_name"></a> [proxy\_test\_ec2\_name](#input\_proxy\_test\_ec2\_name) | EC2 instance name | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Short version of the name of the AWS region in which resources will be administered | `string` | n/a | yes |
| <a name="input_vault_password"></a> [vault\_password](#input\_vault\_password) | Password for connecting to Vault - usually supplied through TF\_VARS | `string` | n/a | yes |
| <a name="input_vault_username"></a> [vault\_username](#input\_vault\_username) | Username for connecting to Vault - usually supplied through TF\_VARS | `string` | n/a | yes |
| <a name="input_volume_type"></a> [volume\_type](#input\_volume\_type) | EBS volume type | `string` | `"gp3"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->