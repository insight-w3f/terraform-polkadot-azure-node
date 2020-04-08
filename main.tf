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
  count               = var.create_eip ? 1 : 0
  location            = data.azurerm_resource_group.this.location
  name                = "public-eip"
  resource_group_name = data.azurerm_resource_group.this.name
  allocation_method   = "Static"
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
    public_ip_address_id          = var.create_eip ? azurerm_public_ip.this[0].id : null
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

resource "azurerm_linux_virtual_machine" "this" {
  count               = var.create ? 1 : 0
  name                = var.node_name
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  size                = var.instance_type
  admin_username      = "ubuntu"
  custom_data         = base64encode(module.user_data.user_data)

  network_interface_ids = [
    azurerm_network_interface.public.id,
    azurerm_network_interface.private.id,
  ]

  admin_ssh_key {
    username   = "ubuntu"
    public_key = file(var.public_key_path)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

module "ansible" {
  source = "github.com/insight-infrastructure/terraform-aws-ansible-playbook.git"

  inventory_template = "${path.module}/ansible_inventory.tpl"

  inventory_template_vars = {
    node-ip   = azurerm_public_ip.this[0].ip_address
    node-name = var.node_name

    wireguard_validator_pubkey = var.wireguard_validator_pubkey
    validator_vpn_peer_addr    = var.validator_vpn_peer_addr
    validator_ip               = var.validator_ip
  }

  playbook_file_path = "${path.module}/ansible/main.yml"

  playbook_vars = {
    node_exporter_enabled = false
  }

  user             = "ubuntu"
  private_key_path = var.private_key_path

  module_depends_on = azurerm_linux_virtual_machine.this
}
