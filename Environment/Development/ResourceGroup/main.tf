module "appservice" {
  source = "./ResourceGroup"

  prefix     = "${var.prefix}"
  location = var.location

}
