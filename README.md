# VSI-database

Use this template to provision a classic virtual server instance (VSI) in IBM Cloud that is set up with an IBM Cloud Databases for PostgreSQL instance by using Terraform or IBM Cloud Schematics. The IBM Cloud database service is automatically configured during the installation and a security group is created so that your virtual server instance can connect to the database port. To ensure that your database instance can be accessed by the virtual server instance only, whitelist rules are added to your database instance. 

To apply the VSI-database template in IBM Cloud with IBM Cloud Schematics, you must select the template from the [IBM Cloud catalog](cloud.ibm.com/catalog/content/LAMP), enter the configuration for your classic virtual server instance and database service, and install the template. When you install the template, IBM Cloud Schematics creates a workspace and starts provisioning your resources by using Terraform. You can review logs and your resources from the IBM Cloud Schematics console. For more information, see the [IBM Cloud Schematics documentation](https://cloud.ibm.com/docs/schematics?topic=schematics-about-schematics). 

For more information about IBM Cloud classic virtual service instances, see [Getting started with virtual servers](https://cloud.ibm.com/docs/vsi?topic=virtual-servers-getting-started-tutorial). 
For more information about IBM Cloud Databases for PostgreSQL, see [Getting started with Databases for PostgreSQL](https://cloud.ibm.com/docs/services/databases-for-postgresql?topic=databases-for-postgresql-getting-started). 

## Costs

When you apply this template, you are charged for the classic virtual server and the database instances that you configure.
- **Classic virtual server instance**: The price for your instance depends on your instance configuration. Make sure to review available [plans](https://www.ibm.com/cloud/virtual-servers/calculator/) before you apply this template in IBM Cloud. By default, your instance is provisioned as a standard virtual server instance with an hourly billing. 
- **Databases for PostgreSQL instance**: The price for your database instance depends on the amount of data in gigabytes (GB) that you store. To find available prices per GB, see the [IBM Cloud catalog](https://cloud.ibm.com/catalog/services/databases-for-postgresql). By default, your instance is billed hourly. 

**Note**: You can remove your virtual server and database instance by [deleting your Schematics workspace or your instances](https://cloud.ibm.com/docs/schematics?topic=schematics-manage-lifecycle#destroy-resources) with IBM Cloud Schematics. Removing the workspace or the instances cannot be undone. Make sure that you back up any data that you must keep before you start the deletion process. 

## Dependencies

Before you can apply the template in IBM Cloud, you must have the following permissions in IBM Cloud Identity and Access Management: 
- **Manager** service access role for IBM Cloud Schematics
- **Add Server** and **Cancel Server** classic infrastructure permissions that you can find in the **Account** permission set
- All permissions that are included in the **Devices** classic infrastructure permission set
- **Add Compute with Public Network Port** classic infrastructure permission that you can find in the **Network** permission set
- **Editor** platform role for IBM Cloud Databases for PostgreSQL

## Configuring your deployment values  

When you select the VSI-database template from the IBM Cloud catalog, you must enter the following values before you can apply the template: 

* `softlayer_api_key`: Enter the API key to access IBM Cloud classic infrastructure. For more information for how to create an API key and retrieve it, see [Managing classic infrastructure API keys](https://cloud.ibm.com/docs/iam?topic=iam-classic_keys). 
* `softlayer_username`: Enter the user name to access IBM Cloud classic infrastructure. You can retrieve the user name by following the instructions for retrieving your classic infrastructure API key. 
* `ibmcloud_api_key`: Enter your IBM Cloud API. To create one, go to the [IBM Cloud API keys page](https://cloud.ibm.com/iam/apikeys).
* `admin-password`: Enter a password for the database administrator. The password must be between 10-32 characters.
* `db-user-password`: Enter a password for the database user that you want to set up. The password must be between 10-32 characters.

You can also choose to customize the default settings for your classic infrastructure virtual server or database instance: 

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


The example is deployed in the eu-gb region. The `region` parameter in the `provider.tf` file must be set to the same region as the IBM Cloud database instance that it's deployed in, as defined by the `location` parameter on the ibm_database resource.


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
