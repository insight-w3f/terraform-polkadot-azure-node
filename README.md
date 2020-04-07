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
| azure\_resource\_group\_name | Name of Azure Resource Group | `string` | n/a | yes |
| environment | The environment | `string` | `""` | no |
| namespace | The namespace to deploy into | `string` | `""` | no |
| network\_name | The network name, ie kusama / mainnet | `string` | `""` | no |
| owner | Owner of the infrastructure | `string` | `""` | no |
| stage | The stage of the deployment | `string` | `""` | no |

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