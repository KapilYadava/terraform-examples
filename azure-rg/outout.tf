output "rg-name" {
  value = azurerm_resource_group.my-rg.id
}

output "sa-name" {
  value = azurerm_storage_account.my-storage
  sensitive = true
}

output "containers" {
    value = azurerm_storage_container.my-test-container[*].name
}