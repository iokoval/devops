variable "name_of_project" {
    type = string
    validation {
      condition = can(regex("^[A-Z]+[a-z]*$", var.name_of_project))
      error_message = "This value must start from capital letter (A-Z)."
    }
}
variable "type_of_project" {
    type = list(string)
    default = [ "api", "frontend", "terraform" ]
}