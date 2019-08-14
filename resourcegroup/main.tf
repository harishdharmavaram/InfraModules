provider "azurerm" {
}
terraform {
  backend "azurerm" {
    storage_account_name  = "jdateststrg"
	resource_group_name   = "terraform-rg"
    container_name        = "versiontf"
    key                   = "terraform.tfstate"
  }
}
resource "azurerm_resource_group" "test" {
  name    = "jtestgroup"
  location  = "East us"
 tags = {
    environment = "testing"
  }
}
resource "azurerm_virtual_network" "test" {
  count               = 2
  name                = "vnet-${count.index}"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  address_space       = ["${element(var.vnet_address_space, count.index)}"]
}
resource "azurerm_subnet" "sub" {
  count                = "4"
  name                 = "sub-${count.index}"
  resource_group_name  = "${azurerm_resource_group.test.name}"
  virtual_network_name = "${element(azurerm_virtual_network.test.*.name, count.index)}"
  address_prefix       = "${element(var.subnet_address_prefix, count.index)}"
}