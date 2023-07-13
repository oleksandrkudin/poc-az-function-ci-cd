resource "azurerm_resource_group" "rg" {
  name = format("%s-%s", var.name_prefix, "rg")
  location = var.location
}
