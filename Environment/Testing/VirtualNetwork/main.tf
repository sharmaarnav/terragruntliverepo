data "azurerm_resource_group" "examplerg" {
  name     = "${var.prefix}-rg"
}

module "virtualnetwork" {
  source = "./virtualnetwork"

  virtual_network_name = "${var.prefix}-vnet01"
  location = var.location
  resource_group_name = data.azurerm_resource_group.examplerg.name
}
