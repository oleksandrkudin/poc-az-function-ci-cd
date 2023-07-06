# resource "azurerm_linux_function_app" "example" {
#   name                = format("%s-%s", var.name_prefix, "func")
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = var.location

#   storage_account_name       = azurerm_storage_account.sa.name
#   storage_account_access_key = azurerm_storage_account.sa.primary_access_key
#   service_plan_id            = azurerm_service_plan.function_plan.id

#   # https_only = true
#   functions_extension_version = "~4"

#   site_config {
#     application_stack {
#       dotnet_version = "6.0"
#       use_dotnet_isolated_runtime = false
#     }
#     use_32_bit_worker = true  # Looks like it does not work - in any case it is set to false!!!
#     ftps_state = "FtpsOnly"
#     cors {
#       allowed_origins = ["https://portal.azure.com"]
#       support_credentials = false
#     }
#   }
# }

resource "azurerm_function_app" "function_app" {
  name                       = format("%s-%s", var.name_prefix, "func")
  location                   = var.location
  resource_group_name        = azurerm_resource_group.rg.name
  app_service_plan_id        = azurerm_service_plan.function_plan.id
  storage_account_name       = azurerm_storage_account.sa.name
  storage_account_access_key = azurerm_storage_account.sa.primary_access_key

  os_type                    = "linux"
  version                    = "~4"

  site_config {
    dotnet_framework_version = "v4.0"
    linux_fx_version = "dotnet-isolated|6.0"
    use_32_bit_worker_process = true
    ftps_state = "FtpsOnly"
  }

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
  }
}
