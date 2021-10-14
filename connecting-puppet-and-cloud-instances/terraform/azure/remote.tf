data "azurerm_resource_group" "puppetize2021mj" {
  name = var.resource_group
}

data "azurerm_subnet" "puppetize2021mj" {
  name = var.subnet
  resource_group_name = data.azurerm_resource_group.puppetize2021mj.name
  virtual_network_name = data.azurerm_virtual_network.puppetize2021mj.name
}

data "azurerm_virtual_network" "puppetize2021mj" {
  name = var.virtual_network
  resource_group_name = data.azurerm_resource_group.puppetize2021mj.name
}

data "azurerm_network_security_group" "puppetize2021mj" {
    name = var.security_group
    resource_group_name = data.azurerm_resource_group.puppetize2021mj.name
}
