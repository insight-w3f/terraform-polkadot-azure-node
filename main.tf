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

resource "azurerm_public_ip" "this" {
  create              = var.create_eip ? 1 : 0
  location            = data.azurerm_resource_group.this.location
  name                = "public-eip"
  resource_group_name = data.azurerm_resource_group.this.name
}

resource "azurerm_network_interface" "public" {
  location            = data.azurerm_resource_group.this.location
  name                = "public-nic"
  resource_group_name = data.azurerm_resource_group.this.name

  ip_configuration {
    name                          = "public"
    primary                       = true
    subnet_id                     = var.public_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.create_eip ? azurerm_public_ip.this.id : null
  }
}

resource "azurerm_network_interface_security_group_association" "public" {
  network_interface_id      = azurerm_network_interface.public.id
  network_security_group_id = var.network_security_group_id
}

resource "azurerm_network_interface_application_security_group_association" "public" {
  application_security_group_id = var.application_security_group_id
  network_interface_id          = azurerm_network_interface.public.id
}

resource "azurerm_network_interface" "private" {
  location            = data.azurerm_resource_group.this.location
  name                = "private-nic"
  resource_group_name = data.azurerm_resource_group.this.name

  ip_configuration {
    name                          = "private"
    subnet_id                     = var.private_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "private" {
  network_interface_id      = azurerm_network_interface.private.id
  network_security_group_id = var.network_security_group_id
}

resource "azurerm_network_interface_application_security_group_association" "private" {
  application_security_group_id = var.application_security_group_id
  network_interface_id          = azurerm_network_interface.private.id
}
