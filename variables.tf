variable "hostname" {
   default = "webapp1"
   description = "The hostname for the instance, for example, webapp1."
}

variable "domain" {
   default = "domain.dev"
   description = "The domain for the virtual machine, for example, domain.dev."
}

variable "datacenter" {
   default = "dal13"
   description = "The data center to create resources in, for example, dal13. To get a list of all data centers, run the `ic sl vs options` command."
}

variable "os-reference-code" {
   default = "CENTOS_LATEST_64"
   description = "The code that is used to provision the computing instance. To view the available OS reference codes, log in to the [IBM Cloud Infrastructure (SoftLayer) API](https://api.softlayer.com/rest/v3/SoftLayer_Virtual_Guest_Block_Device_Template_Group/getVhdImportSoftwareDescriptions.json?objectMask=referenceCode)."
}

variable "flavor" {
   default = "C1_1X1X25"
   description = "The flavor type of the virtual machine."
}


variable "resource-group" {
   description = "The resource group of the account where services are deployed." 
}

variable "resource-instance-name" {
   default = "demo-postgres"
   description = "The unique name for the database instance."
}

variable "database-service-name" {
   default = "databases-for-postgresql"
   description = "The service name of the database."
}

variable "database-service-plan" {
   default = "standard"
   description = "The service plan of the database."   
}

variable "location" {
   default = "eu-gb"
   description = "The location in which to deploy the instance. The region and location must match."
}

variable "admin-password" {
   description = "Enter a password for the database administrator. The password must be between 10-32 characters."
}

variable "members-memory-allocation-mb"{
   default = "3072"
   description = "The memory size for the database that's split across all members."
}


variable "members-disk-allocation-mb"{
   default = "20480"
   description = "The disk size of the database that's split across all members."
}


variable "db-user-name"{
   default = "user123"
   description = "The new database user name."
}

variable "db-user-password"{
  description = "The new database user password." 
