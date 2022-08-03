terraform {
  backend "azurerm" {
    resource_group_name = "azuretestrg"
    storage_account_name = "myteststorage1989"
    container_name= "mytestcontainer19890"
    key= "demotf.terraform.tfstate"
    }
}