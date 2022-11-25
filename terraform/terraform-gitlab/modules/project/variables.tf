variable "type_of_project" {}
variable "name_of_project" {}
variable "gitlab_group_id" {}
variable "list_of_vars" {
    type = map
    default = {
        "AWS_REGION" = "test"
        "ECS_CLUSTER_PROD" = "test"
        "EC_CLUSTER_STAGE" = "test"
        "ECS_SERVICE_STAGE" = "test"
        "ECS_SERVICE_PROD" = "test"
    } 
}
