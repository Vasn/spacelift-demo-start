resource "spacelift_stack" "main" {
  administrative    = false
  autodeploy        = false
  branch            = "main"
  description       = "Provisions a 3 tiered application resource"
  name              = "vas"
  project_root      = ""
  repository        = "spacelift-iac-demo"
  terraform_version = "1.9.8"
}