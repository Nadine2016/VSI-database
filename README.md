# This example shows how to create an IBM Cloud Database and configure connectivity from a VSI

This sample template configures an IBM Cloud database instance and virtual server instances (VSIs). Security groups are configured to allow the VSI to access the IBM Cloud database instance on the dynamically defined IBM Cloud database instance connection port. Whitelisting is configured on the IBM Cloud database instance to only allow access from the VSI IP address. 

## Costs

This sample uses chargeable services and you are charged for the time the services are deployed. The use of `terraform destroy` results in deletion of all resources including the IBM Cloud database service instance. Billing for VSI and IBM Cloud database terminates on the hour. 


## Dependencies

- The user must have IAM access to create and configure an IBM Cloud database instance and VSIs.

## Configuring your deployment values  

The following variables need to be set before you can use the template: 

* `softlayer_username` is the infrastructure user name. Go to https://cloud.ibm.com/iam/users/, select your name, then verify that the user name is listed in the VPN password section.
* `softlayer_api_key` is a classic infrastructure API key. Go to https://cloud.ibm.com/iam/users/, select your name, then verify that a classic infrastructure API key is already created in the API keys section. If you don't have one already, go to https://cloud.ibm.com/iam/#/apikeys and create one.
* `ibmcloud_api_key` is an API key for IBM Cloud services. If you need to create one, go to https://cloud.ibm.com/iam/apikeys.


The example is deployed in the eu-gb region. The `region` parameter in provider.tf must be set to the same region as the IBM Cloud database instance that it's deployed in as defined by the `location` parameter on the ibm_database resource. 

### Deployment values 

You must also set the following deployment values on the Create page. You can enter customized values or accept the defaults.

|Variable Name|Description|Default Value|
|-------------|-----------|-------------|
|hostname| The hostname for the virtual machine. For example: vm1|webapp1| 
|domain | The domain for the virtual machine.For example: domain.dev|test.com|
|datacenter | The data center to create the VSI, for example dal13. To get a list of all data centers, run the `ic sl vs options` command.|lon06|
|os-reference-code | The OS type of the virtual machine.|CENTOS_LATEST_64|
|flavor | The flavor type of the virtual machine.|C1_1X1X25|
|resource-group | The resource group of the account where services are deployed.|Default|
|resource-instance-name | The unique name for the database instance.|demo-postgres|
|database-service-name | The service name of the database.|databases-for-postgresql|
|database-service-plan | The service plan of the database.|standard|
|location | The location where to deploy the service. The region and location must match.|eu-gb|
|admin-password| The default password for admin user.||
|members-memory-allocation-mb| The memory size for the database that's split across all members.|3072|
|members-disk-allocation-mb| The disk size of the database that's split across all members.|20480|
|db-user-name| The new database username.|user123|
|db-user-password| The new database user password.||

**Note** For more information about deployment values, see 
https://ibm-cloud.github.io/tf-ibm-docs/v0.17.3/r/database.html  
https://ibm-cloud.github.io/tf-ibm-docs/v0.17.3/r/compute_vm_instance.html


## Outputs 

The composed connection string for the default admin ID for the deployed IBM Cloud database PostgreSQL database is displayed. Connection string usage depends on the type of IBM Cloud database service deployed. There might be multiple strings for different hosts in the DB cluster. Go to the IBM Cloud database documentation for information about the use of connection strings, https://cloud.ibm.com/docs/services/databases-for-etcd?topic=databases-for-etcd-connection-strings#connection-strings. 


## Running the configuration 
```shell
terraform init
terraform plan
```

For apply phase

```shell
terraform apply
```

```shell
terraform destroy
```  
