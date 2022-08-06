provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "my-rg" {
  name     = var.rg-name
  location = var.location
}

resource "azurerm_storage_account" "my-storage" {
  name                     = var.storage-account-name
  resource_group_name      = azurerm_resource_group.my-rg.name
  location                 = azurerm_resource_group.my-rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = var.tags
}

resource "azurerm_storage_container" "my-test-container" {
  count = 4
  name = "${var.container-name}${count.index}"
  storage_account_name= azurerm_storage_account.my-storage.name
  container_access_type = "private"
  depends_on = [
    azurerm_storage_account.my-storage
  ]
}

resource "azurerm_container_registry" "acr" {
  name                = "myazureregistry1989"
  resource_group_name = azurerm_resource_group.my-rg.name
  location            = azurerm_resource_group.my-rg.location
  sku                 = "Premium"
  admin_enabled       = false
  depends_on = [
    azurerm_storage_account.my-storage
  ]
}

resource "azurerm_kubernetes_cluster" "my-cluster" {
  name                = "myaks"
  location            = azurerm_resource_group.my-rg.location
  resource_group_name = azurerm_resource_group.my-rg.name
  dns_prefix          = "my-aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  depends_on = [
    azurerm_storage_account.my-storage
  ]
}
