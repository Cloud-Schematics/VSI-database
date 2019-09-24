########################################################
# Create VM configured to access ICD database
########################################################

resource "ibm_compute_vm_instance" "webapp1" {
  domain                     = "${var.domain}"
  datacenter                 = "${var.datacenter}"
  hostname                   = "${var.hostname}"
  count                      = 1
  os_reference_code          = "${var.os-reference-code}"
  flavor_key_name            = "${var.flavor}"
  local_disk                 = false
  private_security_group_ids = ["${ibm_security_group.sg_private_lamp.id}"]
  public_security_group_ids  = ["${ibm_security_group.sg_public_lamp.id}"]
  private_network_only       = false
}

data "ibm_resource_group" "group" {
  name = "${var.resource-group}"
}

resource "ibm_database" "test_acc" {
  resource_group_id = "${data.ibm_resource_group.group.id}"
  name              = "${var.resource-instance-name}"
  service           = "${var.database-service-name}"
  plan              ="${var.database-service-plan}"
  location          = "${var.location}"
  adminpassword     = "${var.admin-password}"

  whitelist = {
    address     = "${ibm_compute_vm_instance.webapp1.ipv4_address}/32"
    description = "${ibm_compute_vm_instance.webapp1.hostname}"
  }
  members_memory_allocation_mb = "${var.members-memory-allocation-mb}"
  members_disk_allocation_mb   = "${var.members-disk-allocation-mb}"

  users = {
    name     = "${var.db-user-name}"
    password = "${var.db-user-password}"
  }
}

output "ICD Postgresql database connection string" {
  value = "${"${ibm_database.test_acc.connectionstrings.0.composed}"}"
}
