# Create modules for Terraform-GitLab integration
module "project" {
    source = "./modules/project"
    type_of_project = var.type_of_project
    name_of_project = var.name_of_project
    gitlab_group_id = module.group.gitlab_group_id
}

module "group" {
    source = "./modules/group"
    name_of_project = var.name_of_project
}

module "runner" {
    source = "./modules/runner"
    runners_token = module.group.gitlab_runners_token
}