output "workspaces_and_variables" {
  value = {
    for name, vars in data.tfe_variables.all_workspaces : name => {
      variables = [
        for var in vars.variables : {
          name  = var.name
          value = var.value
        }
        if var.name == "TFC_AZURE_PROVIDER_AUTH" && var.value == "true" ||
        var.name == "TFC_AZURE_RUN_CLIENT_ID"
      ]
    }
  }
}



