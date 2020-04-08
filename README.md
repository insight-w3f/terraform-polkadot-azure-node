# terraform-polkadot-azure-node

[![open-issues](https://img.shields.io/github/issues-raw/insight-w3f/terraform-polkadot-azure-node?style=for-the-badge)](https://github.com/insight-w3f/terraform-polkadot-azure-node/issues)
[![open-pr](https://img.shields.io/github/issues-pr-raw/insight-w3f/terraform-polkadot-azure-node?style=for-the-badge)](https://github.com/insight-w3f/terraform-polkadot-azure-node/pulls)
[![build-status](https://circleci.com/gh/insight-w3f/terraform-polkadot-azure-node.svg?style=svg)](https://circleci.com/gh/insight-w3f/terraform-polkadot-azure-node)

## Features

This module...

## Terraform Versions

For Terraform v0.12.0+

## Usage

```
module "this" {
    source = "github.com/insight-w3f/terraform-polkadot-azure-node"

}
```
## Examples

- [defaults](https://github.com/insight-w3f/terraform-polkadot-azure-node/tree/master/examples/defaults)

## Known  Issues
No issue is creating limit on this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| application\_security\_group\_id | The id of the application security group to run in | `string` | n/a | yes |
| azure\_resource\_group\_name | Name of Azure Resource Group | `string` | n/a | yes |
| create | Bool to create the resources | `bool` | `true` | no |
| create\_eip | Boolean to create elastic IP | `bool` | `false` | no |
| environment | The environment | `string` | `""` | no |
| instance\_type | Instance type | `string` | `"Standard_A2_v2"` | no |
| key\_name | The name of the preexisting key to be used instead of the local public\_key\_path | `string` | `""` | no |
| namespace | The namespace to deploy into | `string` | `""` | no |
| network\_name | The network name, ie kusama / mainnet | `string` | `""` | no |
| network\_security\_group\_id | The id of the network security group to run in | `string` | n/a | yes |
| node\_name | Name of the node | `string` | `"node"` | no |
| owner | Owner of the infrastructure | `string` | `""` | no |
| private\_key\_path | The path to the private ssh key | `string` | `""` | no |
| private\_subnet\_id | The id of the subnet. | `string` | n/a | yes |
| public\_key\_path | The path to the public ssh key | `string` | n/a | yes |
| public\_subnet\_id | The id of the subnet. | `string` | n/a | yes |
| stage | The stage of the deployment | `string` | `""` | no |
| validator\_ip | Validator public IP | `string` | `"34.229.64.120"` | no |
| validator\_vpn\_peer\_addr | Validator VPN peer address | `string` | `"172.16.0.1/24"` | no |
| wireguard\_validator\_pubkey | Validator WG public key | `string` | `"jxvsfOegft5FNmd2HSxGQBz/dmCeluk/iWIYrLMuki0="` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Testing
This module has been packaged with terratest tests

To run them:

1. Install Go
2. Run `make test-init` from the root of this repo
3. Run `make test` again from root

## Authors

Module managed by [Richard Mah](https://github.com/shinyfoil)

## Credits

- [Anton Babenko](https://github.com/antonbabenko)

## License

Apache 2 Licensed. See LICENSE for full details.