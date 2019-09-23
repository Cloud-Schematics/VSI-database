variable "softlayer_username" {
  description = "Enter the user name to access IBM Cloud classic infrastructure. You can retrieve the user name by following the instructions for retrieving your classic infrastructure API key. "
  sensitive   = true
}

variable "softlayer_api_key" {
  description = "Enter the API key to access IBM Cloud classic infrastructure. For more information for how to create an API key and retrieve it, see [Managing classic infrastructure API keys](https://cloud.ibm.com/docs/iam?topic=iam-classic_keys). "
  sensitive   = true
}

variable "ibmcloud_api_key" {
  description = "Enter your IBM Cloud API. To create one, go to the [IBM Cloud API keys page](https://cloud.ibm.com/iam/apikeys)."
  sensitive   = true
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
