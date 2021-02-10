# About
This repository contains a collection of playbooks for automating *some* of the tasks
of performing an in-place upgrade of a Red Hat OpenStack Platform environment
from version 13 to 16.1

# Word of caution
The upgrade of an OpenStack cluster is a very involved process. Before attempting to use these playbooks it is very important to become familiar with the process of performing in-place upgrades of a Red Hat OpenStack platform environment. This will help you understand the impact of each stage of the upgrade process.

While the playbooks in this repository attempt to automate steps in performing an in-place upgrade based on documented procedures[0], there are tasks that will likely require intervention. 

It is also critical to understand that due to the vast cluster configuration compositions possible, these playbooks have been tested on very specific deployment scenarios and does not cover every single scenario possible, but it can serve as a starting point for your upgrade journey

# Tested cluster configurations
These playbooks have been tested on the following scenario:

- Red Hat OpenStack Platform 13.0.14
  - 1 x Virtualized Undercloud (Ovirt)
  - 3 x Virtualized OpenStack Controllers (Ovirt)
  - 2 x Bare-metal OpenStack Compute Nodes
  - Red Hat Satellite for RPM repository management
  - Undercloud registry to host container images to build required containerized services
- Overcloud Features Enabled
  - Independenly Managed or Non-Director Deployed Ceph Cluster
    - Ceph/Rbd backend for block storage volumes(cinder)
    - Cinder backend for images(glance)
    - Local storage for ephemeral disks(nova)
  - Encrypted SSL Endpoints on External API
  - Network isolation using IPv4 addresses
  - Predictable hostnames
  - Predictable IP addresses
  - Neutron ML2/OVS is the default mechanism driver and network agents
   

# Assumptions
- You have familiarized yourself with Red Hat OpenStack Platform 16.1.[Reference](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/16.1/html/framework_for_upgrades_13_to_16.1/planning-and-preparation-for-an-in-place-openstack-platform-upgrade#familiarize-yourself-with-red-hat-openstack-platform-16.1)
- Reviewed the Supported Upgrade Scenarios. [Reference](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/16.1/html/framework_for_upgrades_13_to_16.1/planning-and-preparation-for-an-in-place-openstack-platform-upgrade#supported-upgrade-scenarios-planning)
- Read and understand known issues that might block and upgrade.[Reference](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/16.1/html/framework_for_upgrades_13_to_16.1/planning-and-preparation-for-an-in-place-openstack-platform-upgrade#known-issues-that-might-block-an-upgrade)
- Have a backup and restore plan in place before upgrading.[Reference](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/16.1/html/framework_for_upgrades_13_to_16.1/planning-and-preparation-for-an-in-place-openstack-platform-upgrade#backup-and-restore)
- The RHOSP13 cluster has been updated to the lastest minor release.[Reference](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/16.1/html/framework_for_upgrades_13_to_16.1/planning-and-preparation-for-an-in-place-openstack-platform-upgrade#minor-version-update)
- The RHOSP13 cluster is in a healthy state and contains the latest configuration parameters from templates applied

# Upgrade Workflow
WIP 
 
# Reference documentation 
[0]
[Redhat OpenStack Platform: Framework For Upgrades](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/16.1/html/framework_for_upgrades_13_to_16.1)



Additional information will be added development progresses.


