variable "hostname" {
   default = "webapp1"
   description = "Enter a host name for your classic infrastructure virtual server instance. This host name is used with the `domain` to create the full URL for your classic infrastructure virtual server instance."
}

variable "domain" {
   default = "domain.dev"
   description = "Enter the domain name that you want to assign to your classic infrastructure virtual server instance. This domain name is used with the `hostname` to create the full URL for your classic infrastructure virtual server instance."
}

variable "datacenter" {
   default = "dal13"
   description = "Enter the data center where you want to provision your classic infrastructure virtual server instance. For available data centers, run `ibmcloud sl vs options` and review the values in the 'datacenter' field."
}

variable "os-reference-code" {
   default = "CENTOS_LATEST_64"
   description = "Enter the reference code of the operating system that you want to install on your virtual server instance. To see available OS reference codes, log in to the [IBM Cloud Infrastructure (SoftLayer) API](https://api.softlayer.com/rest/v3/SoftLayer_Virtual_Guest_Block_Device_Template_Group/getVhdImportSoftwareDescriptions.json?objectMask=referenceCode)."
}

variable "flavor" {
   default = "C1_1X1X25"
   description = "Enter the flavor for your classic infrastructure virtual server instance. The flavor determines the type of virtual server instance that you want to create, including available CPU and memory. To find a list of supported flavors, run `ibmcloud sl vs options` and review the values in the 'flavors' field. For an overview of what is included in each flavor, see [Public virtual servers](https://cloud.ibm.com/docs/vsi?topic=virtual-servers-about-public-virtual-servers)."
}

variable "resource-group" {
   description = "Enter the name of the IBM Cloud resource group where you want to provision your database instance. To list available resource groups, run `ibmcloud resource groups`."
}

variable "resource-instance-name" {
   default = "demo-postgres"
   description = "Enter a unique name for your Databases for PostgreSQL service instance."
}

variable "database-service-name" {
   default = "databases-for-postgresql"
   description = "Enter the name of the database that you set up within your Databases for PostgreSQL service instance."
}

variable "database-service-plan" {
   default = "standard"
   description = "Enter the Databases for PostgreSQL service plan that you want."
}

variable "location" {
   default = "eu-gb"
   description = "Enter the location, in which to deploy the database instance. The location that you choose must match the value in `region`. To find available locations, run `ibmcloud regions`."
}

variable "admin-password" {
   description = "Enter a password for the database administrator. The password must be between 10-32 characters."
   sensitive   = true
}

variable "members-memory-allocation-mb" {
   default = "3072"
   description = "Enter the total amount of memory in megabytes that is shared between the database members within the database."
}


variable "members-disk-allocation-mb" {
   default = "20480"
   description = "Enter the disk size in megabytes for the database that is shared across all database members."
}


variable "db-user-name" {
   default = "user123"
   description = "Enter the user name of a database user that you want to set up. "
}

variable "db-user-password" {
   description = "The new database user password. The password must be between 10-32 characters."
   sensitive   = true
}
