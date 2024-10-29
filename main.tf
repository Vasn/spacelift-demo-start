# integration
# currrently manually created via the gui and passed in via a variable ("aws_integration_id")

# modules
resource "spacelift_module" "aws" {
  for_each = var.modules

  repository = var.spacelift_repository
  branch = var.spacelift_branch
  terraform_provider = var.terraform_provider
  name = each.value.name
  project_root = each.value.project_root
  administrative = false
  protect_from_deletion = false
}

resource "spacelift_aws_integration_attachment" "aws_modules" {
  for_each = spacelift_module.aws

  integration_id = var.aws_integration_id
  module_id = each.value.id
  read = true
  write = true
}

# stacks
resource "spacelift_stack" "main" {
  administrative    = false
  autodeploy        = false
  branch            = "main"
  description       = "Provisions a 3 tiered application resource"
  name              = "vas"
  project_root      = ""
  repository        = "spacelift-iac-demo"
  terraform_version = "1.5.7"
}

resource "spacelift_aws_integration_attachment" "vas_stack" {
  integration_id = var.aws_integration_id
  stack_id       = spacelift_stack.main.id
  read           = true
  write          = true
}