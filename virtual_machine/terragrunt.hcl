
terraform {
  source = "..//modules/virtual_machine"
  extra_arguments "force_subscription" {
    commands = [
      "init",
      "apply",
      "destroy",
      "refresh",
      "import",
      "plan",
      "taint",
      "untaint"
    ]
    env_vars = {
       ARM_SUBSCRIPTION_ID = "d1ac2c8c-6294-46bc-ae8c-4188669ccbbc"
     }
}

}

inputs = {
  location = "Canada Central"
  resource_group_name = ["virtualmachine"]
  name = ["server"]
  address_space = ["10.90.0.0/21"]
  address_prefix = ["10.90.0.0/24"]
 
}

remote_state {
  # Disabling since it's causing issues as per
  # https://github.com/gruntwork-io/terragrunt/pull/1317#issuecomment-682041007
  disable_dependency_optimization = true

  backend = "azurerm"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    tenant_id       = "a2091806-2bd5-424d-a1ec-8b44a0373dd1"
    subscription_id = "d1ac2c8c-6294-46bc-ae8c-4188669ccbbc"

    resource_group_name  = "practice-tfstate"
    storage_account_name = "practicetfstatedame"
    container_name       = "tfstate"

    key = "terragrunt.tfstate"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
  required_version = ">= 0.14"
    experiments      = [module_variable_optional_attrs]
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "> 2.73"
    }
  }
}
provider "azurerm" {
  #  client_id = "b3ba4b4f-22cc-4283-ada3-b0126e9be570"
  #  client_secret = "GI48Q~TV33P31bwxak35e~u9~lg.s~RiobaBja~r"
  #  subscription_id = "d1ac2c8c-6294-46bc-ae8c-4188669ccbbc"
  #  tenant_id = "a2091806-2bd5-424d-a1ec-8b44a0373dd1"

    #version  = "2.2.0"
    # The "feature" block is required for AzureRM provider 2.x.
    # If you're using version 1.x, the "features" block is not allowed.
    
  features {}
}

EOF
}

