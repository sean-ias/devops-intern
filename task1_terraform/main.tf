# include at least one special character when special var is set to true:
locals {
  min_special = var.special ? 1 : 0
}

# my main resource with primary variables:
resource random_password passwd_generator {
  count = var.counts
  length  = var.length
  special = var.special
  override_special = var.override_special
  min_lower = 1
  min_upper = 1
  min_numeric = 1
  min_special = local.min_special
}