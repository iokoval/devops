variable "project_name" {
    description = "Value for PagerDuty project name"
    type = string
    validation {
      condition = can(regex("^[A-Z]+[a-z]*$", var.project_name))
      error_message = "This value must start from capital letter (A-Z)"
    }
}
variable "slack_project_name" {
    description = "Value for Slack project name"
    type = string
    validation {
        condition = can(regex("^[a-z]+[a-z]*$", var.slack_project_name))
        error_message = "This value msut start from lower case letter (a-z)."
    }
}