terraform {
  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
      version = "3.18.0"
    }
  }
}

provider "gitlab" {
  # Configuration options
}