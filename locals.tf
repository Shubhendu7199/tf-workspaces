locals {
  workspace_names = keys(data.tfe_workspace_ids.all.ids)
}