# VSI-database template

This sample template configures an IBM Cloud database instance and virtual server instances (VSI). Security groups are configured so that the VSI can access the IBM Cloud database instance on the IBM Cloud database instance connection port, which is dynamically defined. Whitelisting is configured on the IBM Cloud database instance to allow access only from the VSI IP address. 

## Costs

This sample uses chargeable services and you are charged for the time the services are deployed. The use of `terraform destroy` results in deletion of all resources including the IBM Cloud database service instance. Billing for VSI and IBM Cloud database terminates on the hour. 


## Dependencies

The user must have IAM access to create and configure an IBM Cloud database instance and VSIs.

## Configuring your deployment values  

Set the following variables before you use the template: 

* `softlayer_username` is the infrastructure user name. Go to **Access (IAM)** > **Users**, and select your name. Then, verify that the user name is listed in the VPN password section.
* `softlayer_api_key` is a classic infrastructure API key. Go to **Access (IAM)** > **Users**, and select your name. Then, verify that a classic infrastructure API key is included in the API keys section. If you don't have one already, go to the [IBM Cloud API keys page](https://cloud.ibm.com/iam/apikeys) and create one.
* `ibmcloud_api_key` is an API key used for IBM Cloud services. You can create one from the [IBM Cloud API keys page](https://cloud.ibm.com/iam/apikeys).


The example is deployed in the eu-gb region. The `region` parameter in the `provider.tf` file must be set to the same region as the IBM Cloud database instance that it's deployed in, as defined by the `location` parameter on the ibm_database resource. 

### Deployment values 

You must also set the following deployment values on the Create page. You can enter customized values or accept the defaults.

|Variable Name|Description|Default Value|
|-------------|-----------|-------------|
|hostname| The hostname for the virtual machine, for example, vm1.|webapp1| 
|domain | The domain for the virtual machine, for example, domain.dev.|domain.dev|
|datacenter | The data center to create the VSI, for example, dal13. To get a list of all data centers, run the ic sl vs options command.|lon06|
|os-reference-code | The OS type of the virtual machine.|CENTOS_LATEST_64|
|flavor | The flavor type of the virtual machine.|C1_1X1X25|
|resource-group | The resource group of the account where services are deployed.||
|resource-instance-name | The unique name for the database instance.|demo-postgres|
|database-service-name | The service name of the database.|databases-for-postgresql|
|database-service-plan | The service plan of the database.|standard|
|location | The location in which to deploy the instance. The region and location must match.|eu-gb|
|admin-password| Enter a password for the database administrator.||
|members-memory-allocation-mb| The memory size for the database that's split across all members.|3072|
|members-disk-allocation-mb| The disk size of the database that's split across all members.|20480|
|db-user-name| The new database user name.|user123|
|db-user-password| The new database user password.||

**Note** For more information about the deployment values, see the following links:
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
