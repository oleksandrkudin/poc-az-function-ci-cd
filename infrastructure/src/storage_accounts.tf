resource "azurerm_storage_account" "sa" {
  name                     = replace(format("%s-%s", var.name_prefix, "funcappsa"), "-", "")
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_kind             = "Storage"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
