variable "rg-name" {
    default = "azuretestrg"
    description = "This is azure resource group"
}

variable "location" {
    default = "East US"
    description = "This is assigned value for resource group"
}

variable "storage-account-name" {
   default = "myteststorage1989"
}

variable "tags" {
    type = map
    default = {environment = "staging"}
}

variable "container-name" {
  default = "mytestcontainer1989"
}