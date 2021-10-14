data "azurerm_resource_group" "puppetize2021mj" {
  name = "puppetize2021mj"
}

data "azurerm_subnet" "puppetize2021mj" {
  name = "puppetize2021mj"
  resource_group_name = data.azurerm_resource_group.puppetize2021mj.name
  virtual_network_name = data.azurerm_virtual_network.puppetize2021mj.name
}

data "azurerm_virtual_network" "puppetize2021mj" {
  name = "puppetize2021mj"
  resource_group_name = data.azurerm_resource_group.puppetize2021mj.name
}

data "azurerm_network_security_group" "puppetize2021mj" {
    name = "puppetize2021mj"
    resource_group_name = data.azurerm_resource_group.puppetize2021mj.name
}