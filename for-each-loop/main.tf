terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "~> 2.2.0"
      //version = "< 2.2.0, > 2.0.0, !=2.2.3"

    }
  }
}

provider "local" {
  # Configuration options
}

resource "local_file" "name" {
    filename = each.value
    for_each = toset(var.user-texts)
    sensitive_content = data.local_sensitive_file.password-file.content
}

resource "local_file" "count-test" {
    filename = "single"
    sensitive_content = "multiple file will be created but actual is one"
    count = 3
}

data "local_sensitive_file" "password-file" {
    filename = "password"
}