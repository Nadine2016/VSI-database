variable "hostname" {
   default = "webapp1"
}
variable "domain" {
   default = "domain.dev"
}

variable "datacenter" {
   default = "lon06"
}

variable "os-reference-code" {
   default = "CENTOS_LATEST_64"
}

variable "flavor" {
   default = "C1_1X1X25"
}


variable "resource-group" {
}

variable "resource-instance-name" {
   default = "demo-postgres"
}

variable "database-service-name" {
   default = "databases-for-postgresql"
}

variable "database-service-plan" {
   default = "standard"
}

variable "location" {
   default = "eu-gb"
}

variable "admin-password" {
}

variable "members-memory-allocation-mb"{
   default = "3072"
}


variable "members-disk-allocation-mb"{
   default = "20480"
}


variable "db-user-name"{
   default = "user123"
}

variable "db-user-password"{
}
