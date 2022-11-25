variable "name_of_project" {}
variable "list_of_users" {
    type = list(string)
    default = ["ikoval", "ikarpenko"]
}