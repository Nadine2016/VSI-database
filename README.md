# This example shows how to create an IBM Cloud Database and configure connectivity from a VSI

This sample configuration will configure an ICD instance and a VSI. Security Groups are configured to allow the VSI to access the ICD instance on the dynamically defined ICD connection port. Whitelisting is configured on the ICD instance to only allow access from the VSI IP address. 

## Costs

This sample uses chargable services and **will** incur costs for the time the services are deployed. Execution of `terraform destroy` will result in deletion of all resources including the ICD service instance. Billing for VSIs and ICD will terminate on the hour. 


## Dependencies

- User has IAM security rights to create and configure an IBM Cloud Database instance and VSIs

## Configuration 

The following variables need to be set before use

* `softlayer_username` is an Infrastructure user name. Go to https://cloud.ibm.com/iam/users/, select the user, scroll down and check username under VPN password.
* `softlayer_api_key` is an Infrastructure API Key. Go to https://cloud.ibm.com/iam/users/, select the user, scroll down and check Classic infrastructure API key under API keys. If you don't have one already, go to https://cloud.ibm.com/iam/#/apikeys and create a new Classic infrastructure key.
* `ibmcloud_api_key` - An API key for IBM Cloud services. If you don't have one already, go to https://cloud.ibm.com/iam/#/apikeys and create a new key.


The example is deployed in the eu-gb region. The `region` parameter in provider.tf must be set to the same region as the ICD instance will be deployed in as defined by the `location` parameter on the ibm_database resource. 

## Variables

|Variable Name|Description|Default Value|
|-------------|-----------|-------------|
|hostname| The hostname of the virtual machine|webapp1| 
|domain | The domain of the virtual machine|test.com|
|datacenter | The datacenter on which to provision VSI|lon06|
|os-reference-code | The OS type of the virtual machine|CENTOS_LATEST_64|
|flavor | The flavor type of the virtual machine|C1_1X1X25|
|resource-group | The resource group of the account in which services will be deployed|Default|
|resource-instance-name | The unique name for the database instance|demo-postgres|
|database-service-name | The service name of the database|databases-for-postgresql|
|database-service-plan | The service plan of the database|standard|
|location | The location where to deploy the service. The region and location should match to same|eu-gb|
|admin-password| The default password for admin user||
|members-memory-allocation-mb| The memory size for the database, split across all members|3072|
|members-disk-allocation-mb| The disk size of the database, split across all members|20480|
|db-user-name| The new database username|user123|
|db-user-password| The new database user password||

**Note** More information of above resources can be found here  
https://ibm-cloud.github.io/tf-ibm-docs/v0.17.3/r/database.html  
https://ibm-cloud.github.io/tf-ibm-docs/v0.17.3/r/compute_vm_instance.html


## Outputs 

The composed connection string for the default admin ID for the deployed ICD PostgreSQL database is displayed. Connection string usage is dependent on the type of ICD service deployed and there may be multiple strings for different hosts in the DB cluster. Consult the ICD documentation about the use of connection strings, e.g. https://cloud.ibm.com/docs/services/databases-for-etcd?topic=databases-for-etcd-connection-strings#connection-strings 


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
