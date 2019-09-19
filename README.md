# VSI-database template

This sample template configures an IBM Cloud database instance and virtual server instance. Security groups are configured so that the virtual server instance can access the IBM Cloud database instance on the IBM Cloud database instance connection port, which is dynamically defined. Whitelisting is configured on the IBM Cloud database instance to allow access only from the VSI IP address. 

## Costs

This sample uses chargeable services and you are charged for the time the services are deployed. The use of `terraform destroy` results in deletion of all resources including the IBM Cloud database service instance. Billing for virtual server instances and IBM Cloud database terminates on the hour. 


## Dependencies

The user must have IAM access to create and configure an IBM Cloud database instance and virtual server instances.

## Configuring your deployment values  

Set the following variables before you use the template. 

* `softlayer_api_key` is a classic infrastructure API key. Go to the [IBM Cloud API keys page](https://cloud.ibm.com/iam/apikeys). If you don't have one already, create one and save the API key.
* `softlayer_username` is the infrastructure user name. Go to the [IBM Cloud API keys page](https://cloud.ibm.com/iam/apikeys). Click **Details** from the **Actions** menu for your classic infrastructure API key. Copy the API user name for this variable.
* `ibmcloud_api_key` is the IBM Cloud API key for your user identity. Go to the [IBM Cloud API keys page](https://cloud.ibm.com/iam/apikeys) to create one.


### Deployment values 

You must also set the following deployment values on the Create page. You can enter customized values or accept the defaults.

The example is deployed in the eu-gb region. The `region` parameter in the `provider.tf` file must be set to the same region as the IBM Cloud database instance that it's deployed in, as defined by the `location` parameter on the ibm_database resource. 

|Variable Name|Description|Default Value|
|-------------|-----------|-------------|
|hostname| The hostname for the virtual machine, for example, webapp1.|webapp1| 
|domain | The domain for the virtual machine, for example, domain.dev.|domain.dev|
|datacenter | The data center to create the virtual server instance, for example, dal13. To get a list of all data centers, run the `ic sl vs options` command.|dal13|
|os-reference-code | The code that is used to provision the computing instance. To view the available OS reference codes, log in to the [IBM Cloud Infrastructure (SoftLayer) API](https://api.softlayer.com/rest/v3/SoftLayer_Virtual_Guest_Block_Device_Template_Group/getVhdImportSoftwareDescriptions.json?objectMask=referenceCode).|CENTOS_LATEST_64|
|flavor | The flavor type of the VSI.|C1_1X1X25|
|resource-group | The resource group of the account where services are deployed.||
|resource-instance-name | The unique name for the database instance.|demo-postgres|
|database-service-name | The service name of the database.|databases-for-postgresql|
|database-service-plan | The service plan of the database.|standard|
|location | The location in which to deploy the instance. The region and location must match.|eu-gb|
|admin-password| Enter a password for the database administrator. The password must be between 10-32 characters.||
|members-memory-allocation-mb| The memory size for the database that's split across all members.|3072|
|members-disk-allocation-mb| The disk size of the database that's split across all members.|20480|
|db-user-name| The new database user name.|user123|
|db-user-password| The new database user password. The password must be between 10-32 characters.||

**Note** For more information about the deployment values, go to the following pages:
https://ibm-cloud.github.io/tf-ibm-docs/v0.17.3/r/database.html  
https://ibm-cloud.github.io/tf-ibm-docs/v0.17.3/r/compute_vm_instance.html


## Outputs 

The composed connection string for the default admin ID for the deployed IBM Cloud database PostgreSQL database is displayed. Connection string usage depends on the type of IBM Cloud database service that is deployed. There might be multiple strings for different hosts in the database cluster. See the [IBM Cloud database documentation](https://cloud.ibm.com/docs/services/databases-for-etcd?topic=databases-for-etcd-connection-strings#connection-strings) for information about the use of connection strings.

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
