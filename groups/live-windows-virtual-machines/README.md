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
| <a name="module_abbyy_doc_ocr_ec2_security_group"></a> [abbyy\_doc\_ocr\_ec2\_security\_group](#module\_abbyy\_doc\_ocr\_ec2\_security\_group) | terraform-aws-modules/security-group/aws | ~> 3.0 |
| <a name="module_abbyy_doc_ocr_internal_alb"></a> [abbyy\_doc\_ocr\_internal\_alb](#module\_abbyy\_doc\_ocr\_internal\_alb) | terraform-aws-modules/alb/aws | ~> 5.0 |
| <a name="module_abbyy_doc_ocr_internal_alb_security_group"></a> [abbyy\_doc\_ocr\_internal\_alb\_security\_group](#module\_abbyy\_doc\_ocr\_internal\_alb\_security\_group) | terraform-aws-modules/security-group/aws | ~> 3.0 |
| <a name="module_abbyy_doc_ocr_profile"></a> [abbyy\_doc\_ocr\_profile](#module\_abbyy\_doc\_ocr\_profile) | git@github.com:companieshouse/terraform-modules//aws/instance_profile?ref=tags/1.0.59 |  |
| <a name="module_ewok_lic_bac_ec2"></a> [ewok\_lic\_bac\_ec2](#module\_ewok\_lic\_bac\_ec2) | terraform-aws-modules/ec2-instance/aws | 2.19.0 |
| <a name="module_ewok_lic_bac_ec2_security_group"></a> [ewok\_lic\_bac\_ec2\_security\_group](#module\_ewok\_lic\_bac\_ec2\_security\_group) | terraform-aws-modules/security-group/aws | ~> 3.0 |
| <a name="module_ewok_lic_bac_profile"></a> [ewok\_lic\_bac\_profile](#module\_ewok\_lic\_bac\_profile) | git@github.com:companieshouse/terraform-modules//aws/instance_profile?ref=tags/1.0.59 |  |
| <a name="module_ewok_lic_sec_ec2"></a> [ewok\_lic\_sec\_ec2](#module\_ewok\_lic\_sec\_ec2) | terraform-aws-modules/ec2-instance/aws | 2.19.0 |
| <a name="module_ewok_lic_sec_ec2_security_group"></a> [ewok\_lic\_sec\_ec2\_security\_group](#module\_ewok\_lic\_sec\_ec2\_security\_group) | terraform-aws-modules/security-group/aws | ~> 3.0 |
| <a name="module_ewok_lic_sec_profile"></a> [ewok\_lic\_sec\_profile](#module\_ewok\_lic\_sec\_profile) | git@github.com:companieshouse/terraform-modules//aws/instance_profile?ref=tags/1.0.59 |  |
| <a name="module_internal_alb_proxy_metrics"></a> [internal\_alb\_proxy\_metrics](#module\_internal\_alb\_proxy\_metrics) | git@github.com:companieshouse/terraform-modules//aws/alb-metrics?ref=tags/1.0.26 |  |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.abbyy_doc_ocr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.ewok_lic_bac](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.ewok_lic_sec](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_instance.abbyy_doc_ocr_ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_key_pair.abbyy_doc_ocr_keypair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_key_pair.ewok_lic_bac_keypair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_key_pair.ewok_lic_sec_keypair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_lb_target_group_attachment.ec2_alb_assoc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |
| [aws_route53_record.abbyy_doc_ocr_alb_internal](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_acm_certificate.acm_cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/acm_certificate) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_kms_key.ebs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |
| [aws_kms_key.logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |
| [aws_route53_zone.private_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
| [aws_security_group.nagios_shared](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) | data source |
| [aws_security_group.rdp_shared](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) | data source |
| [aws_subnet_ids.application](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) | data source |
| [aws_subnet_ids.web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [vault_generic_secret.abbyy_doc_ocr_ec2_data](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |
| [vault_generic_secret.ewok_lic_bac_ec2_data](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |
| [vault_generic_secret.ewok_lic_sec_ec2_data](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |
| [vault_generic_secret.internal_cidrs](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |
| [vault_generic_secret.kms_keys](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |
| [vault_generic_secret.security_kms_keys](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |
| [vault_generic_secret.security_s3_buckets](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ServiceTeam"></a> [ServiceTeam](#input\_ServiceTeam) | The service team that supports the application | `string` | `"windows-support"` | no |
| <a name="input_abbyy_doc_ocr_ami"></a> [abbyy\_doc\_ocr\_ami](#input\_abbyy\_doc\_ocr\_ami) | ID of the AMI to use for instance | `string` | n/a | yes |
| <a name="input_abbyy_doc_ocr_application"></a> [abbyy\_doc\_ocr\_application](#input\_abbyy\_doc\_ocr\_application) | EC2 application description | `string` | n/a | yes |
| <a name="input_abbyy_doc_ocr_cw_logs"></a> [abbyy\_doc\_ocr\_cw\_logs](#input\_abbyy\_doc\_ocr\_cw\_logs) | Map of log file information; used to create log groups, IAM permissions and passed to the application to configure remote logging | `map(any)` | `{}` | no |
| <a name="input_abbyy_doc_ocr_ec2_count"></a> [abbyy\_doc\_ocr\_ec2\_count](#input\_abbyy\_doc\_ocr\_ec2\_count) | Number of instances | `number` | n/a | yes |
| <a name="input_abbyy_doc_ocr_ec2_instance_size"></a> [abbyy\_doc\_ocr\_ec2\_instance\_size](#input\_abbyy\_doc\_ocr\_ec2\_instance\_size) | The size of the EC2 instance | `string` | n/a | yes |
| <a name="input_abbyy_doc_ocr_ec2_name"></a> [abbyy\_doc\_ocr\_ec2\_name](#input\_abbyy\_doc\_ocr\_ec2\_name) | EC2 instance name | `string` | n/a | yes |
| <a name="input_account"></a> [account](#input\_account) | Short version of the name of the AWS Account in which resources will be administered | `string` | n/a | yes |
| <a name="input_application"></a> [application](#input\_application) | The name of the application | `string` | n/a | yes |
| <a name="input_aws_account"></a> [aws\_account](#input\_aws\_account) | The name of the AWS Account in which resources will be administered | `string` | n/a | yes |
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | The AWS profile to use | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region in which resources will be administered | `string` | n/a | yes |
| <a name="input_default_log_group_retention_in_days"></a> [default\_log\_group\_retention\_in\_days](#input\_default\_log\_group\_retention\_in\_days) | Total days to retain logs in CloudWatch log group if not specified for specific logs | `number` | `365` | no |
| <a name="input_delete_on_termination"></a> [delete\_on\_termination](#input\_delete\_on\_termination) | EBS delete on termination | `string` | `"false"` | no |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | The DNS prefix | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain Name for ACM Certificate | `string` | `"*.companieshouse.gov.uk"` | no |
| <a name="input_ebs_encrypted"></a> [ebs\_encrypted](#input\_ebs\_encrypted) | EBS encrypted | `string` | `"true"` | no |
| <a name="input_ebs_optimized"></a> [ebs\_optimized](#input\_ebs\_optimized) | If true, the launched EC2 instance will be EBS-optimized | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The name of the environment | `string` | n/a | yes |
| <a name="input_ewok_lic_bac_ami"></a> [ewok\_lic\_bac\_ami](#input\_ewok\_lic\_bac\_ami) | ID of the AMI to use for instance | `string` | n/a | yes |
| <a name="input_ewok_lic_bac_application"></a> [ewok\_lic\_bac\_application](#input\_ewok\_lic\_bac\_application) | EC2 application description | `string` | n/a | yes |
| <a name="input_ewok_lic_bac_cw_logs"></a> [ewok\_lic\_bac\_cw\_logs](#input\_ewok\_lic\_bac\_cw\_logs) | Map of log file information; used to create log groups, IAM permissions and passed to the application to configure remote logging | `map(any)` | `{}` | no |
| <a name="input_ewok_lic_bac_ec2_instance_size"></a> [ewok\_lic\_bac\_ec2\_instance\_size](#input\_ewok\_lic\_bac\_ec2\_instance\_size) | The size of the EC2 instance | `string` | n/a | yes |
| <a name="input_ewok_lic_bac_ec2_name"></a> [ewok\_lic\_bac\_ec2\_name](#input\_ewok\_lic\_bac\_ec2\_name) | EC2 instance name | `string` | n/a | yes |
| <a name="input_ewok_lic_sec_ami"></a> [ewok\_lic\_sec\_ami](#input\_ewok\_lic\_sec\_ami) | ID of the AMI to use for instance | `string` | n/a | yes |
| <a name="input_ewok_lic_sec_application"></a> [ewok\_lic\_sec\_application](#input\_ewok\_lic\_sec\_application) | EC2 application description | `string` | n/a | yes |
| <a name="input_ewok_lic_sec_cw_logs"></a> [ewok\_lic\_sec\_cw\_logs](#input\_ewok\_lic\_sec\_cw\_logs) | Map of log file information; used to create log groups, IAM permissions and passed to the application to configure remote logging | `map(any)` | `{}` | no |
| <a name="input_ewok_lic_sec_ec2_instance_size"></a> [ewok\_lic\_sec\_ec2\_instance\_size](#input\_ewok\_lic\_sec\_ec2\_instance\_size) | The size of the EC2 instance | `string` | n/a | yes |
| <a name="input_ewok_lic_sec_ec2_name"></a> [ewok\_lic\_sec\_ec2\_name](#input\_ewok\_lic\_sec\_ec2\_name) | EC2 instance name | `string` | n/a | yes |
| <a name="input_fe_health_check_path"></a> [fe\_health\_check\_path](#input\_fe\_health\_check\_path) | Target group health check path | `string` | `"/"` | no |
| <a name="input_fe_service_port"></a> [fe\_service\_port](#input\_fe\_service\_port) | Target group backend port | `number` | `80` | no |
| <a name="input_get_password_data"></a> [get\_password\_data](#input\_get\_password\_data) | If true, wait for password data to become available and retrieve it. | `bool` | `false` | no |
| <a name="input_monitoring"></a> [monitoring](#input\_monitoring) | If true, the launched EC2 instance will have detailed monitoring enabled | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | Short version of the name of the AWS region in which resources will be administered | `string` | n/a | yes |
| <a name="input_vault_password"></a> [vault\_password](#input\_vault\_password) | Password for connecting to Vault - usually supplied through TF\_VARS | `string` | n/a | yes |
| <a name="input_vault_username"></a> [vault\_username](#input\_vault\_username) | Username for connecting to Vault - usually supplied through TF\_VARS | `string` | n/a | yes |
| <a name="input_volume_type"></a> [volume\_type](#input\_volume\_type) | EBS volume type | `string` | `"gp3"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->