data "tfe_workspace_ids" "all" {
  names        = ["*"]
  organization = "Shubhendu"

  depends_on = [module.workspace1]
}

data "tfe_variables" "all_workspaces" {
  for_each     = toset(local.workspace_names)
  workspace_id = data.tfe_workspace_ids.all.ids[each.key]

  depends_on = [data.tfe_workspace_ids.all]
}