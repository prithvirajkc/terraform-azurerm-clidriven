locals {
  resource-name = "${var.env}-${var.rg-name}"
  vnet-name = "${var.env}-${var.vnet-name}"
  subnet-name = "${var.vnet-name}-${var.subnet-name}"
}