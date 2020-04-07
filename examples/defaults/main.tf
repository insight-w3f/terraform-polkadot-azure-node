provider "azurerm" {
  version = "=2.0.0"
  features {}
}

resource "azurerm_resource_group" "this" {
  location = "eastus"
  name     = "asg-default-testing"
}

variable "public_key_path" {}
variable "private_key_path" {}

module "network" {
  source                    = "github.com/insight-w3f/terraform-polkadot-azure-network.git?ref=master"
  azure_resource_group_name = azurerm_resource_group.this.name
}

module "defaults" {
  source                        = "../.."
  create                        = true
  create_eip                    = true
  public_key_path               = var.public_key_path
  application_security_group_id = module.network.sentry_application_security_group_id[0]
  azure_resource_group_name     = azurerm_resource_group.this.name
  network_security_group_id     = module.network.sentry_network_security_group_id[0]
  private_subnet_id             = module.network.private_subnets[0]
  public_subnet_id              = module.network.public_subnets[0]
}
