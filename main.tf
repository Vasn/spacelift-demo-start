# integration
# currrently manually created via the gui and passed in via a variable ("aws_integration_id")

# modules
resource "spacelift_module" "vpc" {
  name = "vpc"
  terraform_providerr = "aws"
  administrative = false
  branch = "main"
  repository = "spacelift-modules-demo"
  project_root = "vpc"
  protect_from_deletion = false
}

resource "spacelift_aws_integration_attachment" "vpc" {
  integration_id = var.aws_integration_id
  module_id = spacelift_module.vpc.id
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
  use_smart_sanitization = true
}