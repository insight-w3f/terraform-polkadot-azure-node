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

module "defaults" {
  source           = "../.."
  public_key_path  = var.public_key_path
  private_key_path = var.private_key_path
}
