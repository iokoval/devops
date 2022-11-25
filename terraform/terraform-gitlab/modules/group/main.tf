terraform {
  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
    }
  }
}

data "gitlab_user" "example-two" {
    for_each = toset(["max_ryblya", "ikarpenko", "dmitry_chekalin", "sergey_volkov"])
    username = each.value
}
resource "gitlab_group" "project" {
    name = "${var.name_of_project}"
    path = "${var.name_of_project}"
    description = "Group for ${var.name_of_project} project"
    visibility_level = "private"
    subgroup_creation_level = "maintainer"
    request_access_enabled = true
}

resource "gitlab_group_membership" "userlist" {
    count = length(data.gitlab_user.example-two)
    group_id = gitlab_group.project.id
    user_id = values(data.gitlab_user.example-two)[count.index].id
    access_level = "maintainer"
}