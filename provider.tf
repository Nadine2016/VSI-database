variable "region" {
  default = "eu-gb"
  description = "Enter the IBM Cloud region where you want to deploy your Databases for PostgreSQL service instance. The region must match the value in `location`. To find available regions, run `ibmcloud regions`."
}



provider "ibm" {
  region             = "${var.region}"
}
