terraform {
  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
    }
  }
}


resource "gitlab_runner" "runner" {
    registration_token = "${var.runners_token}"
}