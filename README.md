# Terraform Basic Commands
    alias tf=Terraform
    tf init - install provider plugins
    tf validate - validate changes
    tf plan - check error before apply changes 
    tf apply - create and update resources (tfstate, tfstate.backup, and lock.hcl files created)
    tf destroy - delete all created resources
    tf show - show terraform state
    tf provider - see required provider
    tf output - show output variable 
    tf output <output-name>

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


# Varible Definatin Percedence 

Top to Bottom (first)
1. Environment Varibale
2. terraform.tfvars
3. *auto.tfvars (alphabatical order)
4. -var or -var-file (commond-line-argument)

# Resource lifecycle

1. create_before_destroy = true/false
2. prevent_destroy = true/false
3. ingnore_changes = [ tags] or all

Note: tfstate.lock.info file is created for mutual exclusion during plan and apply.
