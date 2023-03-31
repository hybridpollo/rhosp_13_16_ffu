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

echo 'Running the overcloud upgrade coverge command.'

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
  -e ${THT_DEFAULT}/environments/services/neutron-ovn-dvr-ha.yaml \
  -e ${THT_DEFAULT}/environments/ssl/tls-endpoints-public-dns.yaml \
  -e ${THT_DEFAULT}/environments/disable-telemetry.yaml \
  -e ${THT_CUSTOM}/node_info.yaml \
  -e ${THT_CUSTOM}/container_prepare_parameters_osp16.yaml \
  -e ${THT_CUSTOM}/customizations.yaml \
  -e ${THT_CUSTOM}/first_boot.yaml \
  -e ${THT_CUSTOM}/environments/network_environment.yaml \
  -e ${THT_CUSTOM}/predictable_hostnames.yaml \
  -e ${THT_CUSTOM}/predictable_ip_addresses.yaml \
  -e ${THT_CUSTOM}/environments/inject_trust_anchor.yaml \
  -e ${THT_CUSTOM}/environments/enable_tls.yaml \
  -e ${THT_CUSTOM}/environments/glance_nfs.yaml \
  -e ${THT_CUSTOM}/environments/cinder_nfs.yaml \
  -e ${THT_CUSTOM}/environments/sshd_banner.yaml \
  -e ${THT_CUSTOM}/environments/disable_swift.yaml \
  -e ${THT_CUSTOM}/upgrades_environment_osp16.yaml
