variable "softlayer_username" {
  description = "Enter your classic infrastructure user name. Go to the [IBM Cloud API keys page](https://cloud.ibm.com/iam/apikeys), and select Details from the Actions menu for your classic infrastructure API key. Then, retrieve your user name."
}

variable "softlayer_api_key" {
  description = "Enter your classic infrastructure API key. Go to the [IBM Cloud API keys page](https://cloud.ibm.com/iam/apikeys) to create one, or get an existing one by selecting Details from the Actions menu for the API key."
}

variable "ibmcloud_api_key" {
  description = "Enter your IBM Cloud API key. If you need to create one, go to the [IBM Cloud API keys page](https://cloud.ibm.com/iam/apikeys)."
}

variable "region" {
   default = "eu-gb"
   description = "Enter the IBM Cloud region where you want to deploy your Databases for PostgreSQL service instance. The region must match the value in `location`. To find available regions, run `ibmcloud regions`."
}



provider "ibm" {
  softlayer_username = "${var.softlayer_username}"
  softlayer_api_key  = "${var.softlayer_api_key}"
  ibmcloud_api_key    = "${var.ibmcloud_api_key}"
  region             = "${var.region}"
}
