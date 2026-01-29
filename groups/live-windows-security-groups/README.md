# aws-windows-infrastructure-terraform

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0, < 2.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0, < 6.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >= 3.25.0, < 5.3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0, < 6.0 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | >= 3.25.0, < 5.3.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_chips_estor_security_group"></a> [chips\_estor\_security\_group](#module\_chips\_estor\_security\_group) | terraform-aws-modules/security-group/aws | ~> 5.0 |
| <a name="module_designer_server_security_group"></a> [designer\_server\_security\_group](#module\_designer\_server\_security\_group) | terraform-aws-modules/security-group/aws | ~> 5.0 |
| <a name="module_prod_generate_server_security_group"></a> [prod\_generate\_server\_security\_group](#module\_prod\_generate\_server\_security\_group) | terraform-aws-modules/security-group/aws | ~> 5.0 |
| <a name="module_rempro_server_security_group"></a> [rempro\_server\_security\_group](#module\_rempro\_server\_security\_group) | terraform-aws-modules/security-group/aws | ~> 5.0 |
| <a name="module_smart_vault_1_server_security_group"></a> [smart\_vault\_1\_server\_security\_group](#module\_smart\_vault\_1\_server\_security\_group) | terraform-aws-modules/security-group/aws | ~> 5.0 |
| <a name="module_smart_vault_2_server_security_group"></a> [smart\_vault\_2\_server\_security\_group](#module\_smart\_vault\_2\_server\_security\_group) | terraform-aws-modules/security-group/aws | ~> 5.0 |
| <a name="module_test_dev_generate_server_security_group"></a> [test\_dev\_generate\_server\_security\_group](#module\_test\_dev\_generate\_server\_security\_group) | terraform-aws-modules/security-group/aws | ~> 5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [vault_generic_secret.azure_dc_cidrs](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |
| [vault_generic_secret.smart_onprem_cidrs](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |
| [vault_generic_secret.sql_cidrs](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account"></a> [account](#input\_account) | Short version of the name of the AWS Account in which resources will be administered | `string` | n/a | yes |
| <a name="input_application"></a> [application](#input\_application) | The name of the application | `string` | n/a | yes |
| <a name="input_aws_account"></a> [aws\_account](#input\_aws\_account) | The name of the AWS Account in which resources will be administered | `string` | n/a | yes |
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | The AWS profile to use | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region in which resources will be administered | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The name of the environment | `string` | n/a | yes |
| <a name="input_hashicorp_vault_password"></a> [hashicorp\_vault\_password](#input\_hashicorp\_vault\_password) | The password used when retrieving configuration from Hashicorp Vault | `string` | n/a | yes |
| <a name="input_hashicorp_vault_username"></a> [hashicorp\_vault\_username](#input\_hashicorp\_vault\_username) | The username used when retrieving configuration from Hashicorp Vault | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Short version of the name of the AWS region in which resources will be administered | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
