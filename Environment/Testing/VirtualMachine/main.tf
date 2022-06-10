data "azurerm_resource_group" "examplerg" {
  name     = "${var.prefix}-rg"
}

data "azurerm_subnet" "example" {
  name = "${var.prefix}-vnet01-subnet01"
  virtual_network_name = "${var.prefix}-vnet01"
  resource_group_name = data.azurerm_resource_group.examplerg.name
}

module "virtualmachine" {
  source = "./VirtualMachine"

  vm_name = "${var.prefix}-vm01"
  location = var.location
  resource_group_name = data.azurerm_resource_group.examplerg.name
  subnet_id = data.azurerm_subnet.example.id
}
