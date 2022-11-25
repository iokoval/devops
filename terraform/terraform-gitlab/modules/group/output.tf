# Output for gitlab_group_id
output "gitlab_group_id" {
    value = gitlab_group.project.id
}

output "gitlab_runners_token" {
    value = gitlab_group.project.runners_token
}

output "user_ids" {
    value = values(data.gitlab_user.example-two)[*].id
}