resource "azurerm_storage_account" "sa" {
  name                     = replace(format("%s-%s", "funcappsa"), "-", "")
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}