
module "resource_group" {
  source              = "../child_module/resource_group"
  resource_group_name = var.resource_group
  location            = var.location
}