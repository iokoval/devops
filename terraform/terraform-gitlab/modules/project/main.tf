terraform {
  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
    }
  }
}

resource "gitlab_project" "project" {
    count = 3
    name = "${var.type_of_project[count.index]}"
    description = "This is project for ${var.name_of_project}-${var.type_of_project[count.index]}"
    namespace_id = var.gitlab_group_id
    visibility_level = "private"
}

resource "gitlab_project_variable" "project_variables_api" {
    for_each = var.list_of_vars
    project = gitlab_project.project.0.id
    key = each.key
    value = each.value
}
resource "gitlab_project_variable" "project_variables_front" {
    for_each = var.list_of_vars
    project = gitlab_project.project.1.id
    key = each.key
    value = each.value
}
resource "gitlab_project_variable" "project_variables_terraform" {
    for_each = var.list_of_vars
    project = gitlab_project.project.2.id
    key = each.key
    value = each.value
}