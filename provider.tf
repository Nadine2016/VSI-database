variable "region" {
   default = "eu-gb"
}

provider "ibm" {
  region             = "${var.region}"
}
