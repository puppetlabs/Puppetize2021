terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" { 
    # version = "~> 2.17"
    features {}

    # These credentials are passed in the `spec.vars` section of the Relay workflow
    subscription_id = var.subscription_id
    client_id       = var.client_id
    client_secret   = var.client_secret
    tenant_id       = var.tenant_id
}

resource "azurerm_linux_virtual_machine" "puppetize2021mj" {
  name                = var.vm_name
  resource_group_name = data.azurerm_resource_group.puppetize2021mj.name
  location            = data.azurerm_resource_group.puppetize2021mj.location
  size                = "Standard_A1"
  admin_username      = "ubuntu"
  tags = {
    role = var.role
    environment = var.environment
  }
  network_interface_ids = [
    azurerm_network_interface.puppetize2021mj.id
  ]

  admin_ssh_key {
    username   = "ubuntu"
    public_key = var.ssh_key
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

resource "azurerm_public_ip" "puppetize2021mj" {
  name = var.vm_name
  domain_name_label            = var.vm_name
  location                     = var.region
  resource_group_name          = data.azurerm_resource_group.puppetize2021mj.name
  allocation_method            = "Dynamic"
}

resource "azurerm_network_interface" "puppetize2021mj" {
    name = "${var.vm_name}-nic"
    location                    = var.region
    resource_group_name         = data.azurerm_resource_group.puppetize2021mj.name

    ip_configuration {
        name                          = var.vm_name
        subnet_id                     = data.azurerm_subnet.puppetize2021mj.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.puppetize2021mj.id
    }
}

# TODO: This gets moved to the Resource Group manifests.
# resource "azurerm_subnet_network_security_group_association" "puppetize2021mj" {
#  subnet_id                 = data.azurerm_subnet.puppetize2021mj.id
#  network_security_group_id = data.azurerm_network_security_group.puppetize2021mj.id
# }

output "azurevm_dns_name" {
  description = "fqdn to connect to the first vm provisioned."
  value       = azurerm_public_ip.puppetize2021mj.fqdn
}