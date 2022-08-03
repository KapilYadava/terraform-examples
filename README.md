# Terraform basic types
1. string
2. number
3. bool
4. list -> list(string), list(number), list(bool)
5. set -> set(string), set(number), set(bool)
6. map -> set (string), map(number), map(bool)
7. tuble -> similar to list but contains hetrogenuos types

# Terraform Basic Commands
    alias tf=terraform
    tf init - install provider plugins
    tf validate - validate changes
    tf plan - check error before apply changes 
    tf apply - create and update resources (tfstate, tfstate.backup, and lock.hcl files created)
    tf destroy - delete all created resources
    tf destroy <res-name> - delete specific resource
    tf show - show terraform state
    tf provider - see required provider
    tf output - show output variable 
    tf output <output-name>
    tf fmt - formate tf files
    tf state list - check created resource
    tf state pull | jq . - pull state file
    tf state pull | jq '.resources[] | select(.type== "azurerm_storage_account")' - select only type storage account
    tf state pull | jq '.resources[] | select(.type== "azurerm_storage_account") | .instances[].attributes.access_tier' - show only access tier from storage account
    tf state rm <res-name> - remove resource from state file

# Multiple ways to supply input variable
1. using TF_VAR (envrionment variables)
        $ export TF_VAR_<input-name1>="<value1>"
        $ export TF_VAR_<input-name2>="<value2>"
        tf apply

2. Using terraform.tfvars
        tf apply -var-file variables.tfvars

3. using *.auto.tfvars 

4. using var
        tf apply -var "<input-name1=value1>" -var "<input-name2=value2>"  (mutlple var can defined)


# Varible Defination Percedence 

Top to Bottom (first)
1. Environment Varibale
2. terraform.tfvars
3. *auto.tfvars (alphabatical order)
4. -var or -var-file (commond-line-argument)

# Resource lifecycle

1. create_before_destroy = true/false
2. prevent_destroy = true/false
3. ingnore_changes = [ tags] or all

# Version constrains

terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
       version = "~> 2.2.0"
      //version = "< 2.2.0, > 2.0.0, !=2.2.3"
    }
  }
}

1. tf init -upgrade

Note: tfstate.lock.info file is created for mutual exclusion during plan and apply.
