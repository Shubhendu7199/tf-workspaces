variable "workspace_name" {
  type = string
}

variable "workspace_description" {
  type = string
}

variable "trigger_patterns" {
  type    = list(string)
  default = []
}

variable "working_directory" {
  type    = string
  default = ""
}

variable "execution_mode" {
  type = string
}

variable "vcs_repo_configuration" {
  type = object({
    name         = string
    organization = string
    branch       = string
  })
  default = null
}

variable "variables" {
  type = map(object({
    value       = string
    description = string
    category    = string
  }))

  default = {}
}

variable "organization_name" {
  type = string
}

variable "project_name" {
  type = string
}