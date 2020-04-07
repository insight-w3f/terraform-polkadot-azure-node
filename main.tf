module "label" {
  source = "github.com/robc-io/terraform-null-label.git?ref=0.16.1"
  tags = {
    NetworkName = var.network_name
    Owner       = var.owner
    Terraform   = true
    VpcType     = "main"
  }

  environment = var.environment
  namespace   = var.namespace
  stage       = var.stage
}

data "azurerm_resource_group" "this" {
  name = var.azure_resource_group_name
}

module "user_data" {
  source         = "github.com/insight-w3f/terraform-polkadot-user-data.git?ref=master"
  cloud_provider = "azure"
  type           = "library"
}
