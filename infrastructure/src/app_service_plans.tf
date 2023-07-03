resource "azurerm_service_plan" "function_plan" {
  name                = format("%s-%s", var.name_prefix, "app-plan")
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "F1"
}
