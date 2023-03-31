#!/usr/bin/env bash
#
###################################################
# Variables
###################################################
THT_DEFAULT="/usr/share/openstack-tripleo-heat-templates"
THT_CUSTOM="/home/stack/overcloud_deployment/templates"
RC_FILE="/home/stack/stackrc"

if [[ $USER != "stack" ]]; then
  echo -e "ERROR: Deploy script  must be run as the stack user."
  exit 1
fi

echo 'Running the overcloud upgrade converge command.'

if test -f "${RC_FILE}" ; then
  source ${RC_FILE}
  cd /home/stack
else
  echo -e "Undercloud environment file: ${RC_FILE} does not exist!"
  exit 1
fi


###################################################
# Deploy
###################################################
openstack overcloud upgrade converge --templates \
  -r ${THT_CUSTOM}/roles_data_osp16.yaml \
  -n ${THT_CUSTOM}/network_data.yaml \
  -e ${THT_DEFAULT}/environments/network-isolation.yaml \
  -e ${THT_DEFAULT}/environments/ssl/tls-endpoints-public-dns.yaml \
  -e ${THT_DEFAULT}/environments/ceph-ansible/ceph-ansible.yaml \
  -e ${THT_DEFAULT}/environments/services/neutron-ovs.yaml \
  -e ${THT_CUSTOM}/node-info.yaml \
  -e ${THT_CUSTOM}/customizations.yaml \
  -e ${THT_CUSTOM}/first_boot.yaml \
  -e ${THT_CUSTOM}/environments/network-environment.yaml \
  -e ${THT_CUSTOM}/predictable_hostnames.yaml \
  -e ${THT_CUSTOM}/predictable_ip_addresses.yaml \
  -e ${THT_CUSTOM}/environments/inject-trust-anchor-hiera.yaml \
  -e ${THT_CUSTOM}/environments/enable-tls.yaml \
  -e ${THT_CUSTOM}/environments/sshd-banner.yaml \
  -e ${THT_CUSTOM}/environments/disable-telemetry.yaml \
  -e ${THT_CUSTOM}/environments/disable-swift.yaml \
  -e ${THT_CUSTOM}/environments/ceph-storage-environment.yaml \
  -e ${THT_CUSTOM}/upgrades-environment.yaml \
  -e ${THT_CUSTOM}/hieradata_override.yaml \
  -e ${THT_CUSTOM}/containers-prepare-parameters.yaml
