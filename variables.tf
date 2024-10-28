variable "aws_integration_id" {
  type = string
}

variable "spacelift_repository" {
  type = string
}

variable "spacelift_branch" {
  type = string
}

variable "modules" {
  type = map(object({
    name = string
    terraform_provider = string
    project_root = string
  }))
}