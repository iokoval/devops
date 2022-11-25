output "gitlab_project_ids" {
    default = gitlab_project.project.*.id
}