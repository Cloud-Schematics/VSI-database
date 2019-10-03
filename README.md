# VSI-database

Use this template to provision a classic virtual server instance (VSI) in IBM Cloud that is set up with an IBM Cloud Databases for PostgreSQL instance by using Terraform or IBM Cloud Schematics. The IBM Cloud database service is automatically configured during the installation and security groups are created so that your virtual server instance can connect to the database port. To ensure that your database instance can be accessed by the virtual server instance only, whitelist rules are added to your database instance. 

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

* `iaas_classic_api_key`: Enter the API key to access IBM Cloud classic infrastructure. For more information on how to create an API key and retrieve it, see [Managing classic infrastructure API keys](https://cloud.ibm.com/docs/iam?topic=iam-classic_keys). 
* `iaas_classic_username`: Enter the user name to access IBM Cloud classic infrastructure. You can retrieve the user name by following the instructions for retrieving your classic infrastructure API key. 
* `admin-password`: Enter a password for the database administrator. The password must be between 10-32 characters.
* `db-user-password`: Enter a password for the database user that you want to set up. The password must be between 10-32 characters.
* `resource-group` : Enter the name of the IBM Cloud resource group where you want to provision your database instance. To list available resource groups, run `ibmcloud resource groups`.

You can also choose to customize the default settings for your classic infrastructure virtual server or database instance: 

|Variable Name|Description|Default Value|
|-------------|-----------|-------------|
|hostname| Enter a host name for your classic infrastructure virtual server instance. This host name is used with the `domain` to create the full URL for your classic infrastructure virtual server instance. |webapp1| 
|domain | Enter the domain name that you want to assign to your classic infrastructure virtual server instance. This domain name is used with the `hostname` to create the full URL for your classic infrastructure virtual server instance.|domain.dev|
|datacenter | Enter the data center where you want to provision your classic infrastructure virtual server instance. For available data centers, run `ibmcloud sl vs options` and review the values in the **datacenter** field.|dal13|
|os-reference-code | Enter the reference code of the operating system that you want to install on your virtual server instance. To see available OS reference codes, log in to the [IBM Cloud Infrastructure (Classic Infrastructure) API](https://api.softlayer.com/rest/v3/SoftLayer_Virtual_Guest_Block_Device_Template_Group/getVhdImportSoftwareDescriptions.json?objectMask=referenceCode).|CENTOS_LATEST_64|
|flavor | Enter the flavor for your classic infrastructure virtual server instance. The flavor determines the type of virtual server instance that you want to create, including available CPU and memory. To find a list of supported flavors, run `ibmcloud sl vs options` and review the values in the **flavors** field. For an overview of what is included in each flavor, see [Public virtual servers](https://cloud.ibm.com/docs/vsi?topic=virtual-servers-about-public-virtual-servers).|C1_1X1X25|
|resource-instance-name | Enter a unique name for your Databases for PostgreSQL service instance.|demo-postgres|
|database-service-name | Enter the name of the database that you set up within your Databases for PostgreSQL service instance. |databases-for-postgresql|
|database-service-plan | Enter the Databases for PostgreSQL service plan that you want. |standard|
|region | Enter the IBM Cloud region where you want to deploy your Databases for PostgreSQL service instance. The region must match the value in `location`. To find available regions, run `ibmcloud regions`. |
|location | Enter the location, in which to deploy the database instance. The location that you choose must match the value in `region`. To find available locations, run `ibmcloud regions`. |eu-gb|
|members-memory-allocation-mb| Enter the total amount of memory in megabytes that is shared between the database members within the database.|3072|
|members-disk-allocation-mb| Enter the disk size in megabytes for the database that is shared across all database members. |20480|
|db-user-name| Enter the user name of a database user that you want to set up. |user123|

## Output

When you apply the template and your classic virtual server and database instances are successfully provisioned in IBM Cloud, you see the composed database connection string that you can use to connect to your Databases for PostgreSQL service instance by using the `admin` user. For more information about database connection strings, see [Creating Users and Getting Connection Strings](https://cloud.ibm.com/docs/services/databases-for-etcd?topic=databases-for-etcd-connection-strings#connection-string).


