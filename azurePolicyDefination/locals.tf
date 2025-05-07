locals {
  policy_data = jsondecode(file("../../files/azurePolicyDefinationJson/${var.file_name}"))
}