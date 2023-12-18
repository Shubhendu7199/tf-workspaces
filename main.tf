module "workspace1" {
  source                = "./module"
  organization_name     = "Shubhendu"
  project_name          = "TF-Workspaces"
  workspace_name        = "test-ws"
  workspace_description = "Testing Workspace Creation"
  execution_mode        = "remote"
  variables = {
    TF_test = {
      value       = "hsubh"
      category    = "terraform"
      description = "test"
    }
    TFC_AZURE_PROVIDER_AUTH = {
      value       = "true"
      category    = "env"
      description = "Dynamic cred"
    }
    TFC_AZURE_RUN_CLIENT_ID = {
      value       = "12345678910"
      category    = "env"
      description = "Dynamic cred"
    }
  }
}
