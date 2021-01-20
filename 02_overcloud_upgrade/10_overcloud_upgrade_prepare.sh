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

echo 'Running the overcloud upgrade prepare command.'

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
openstack overcloud upgrade prepare --templates \
  --stack overcloud \
  -r ${THT_CUSTOM}/roles_data.yaml \
  -n ${THT_CUSTOM}/network_data.yaml \
  -e ${THT_DEFAULT}/environments/network-isolation.yaml \
  -e ${THT_DEFAULT}/environments/ssl/tls-endpoints-public-dns.yaml \
  -e ${THT_DEFAULT}/environments/ceph-ansible/ceph-ansible-external.yaml \
  -e ${THT_DEFAULT}/environments/services/neutron-ovs.yaml \
  -e ${THT_CUSTOM}/node-info.yaml \
  -e ${THT_CUSTOM}/customizations.yaml \
  -e ${THT_CUSTOM}/first_boot.yaml \
  -e ${THT_CUSTOM}/environments/network-environment.yaml \
  -e ${THT_CUSTOM}/ips-from-pool-all.yaml \
  -e ${THT_CUSTOM}/environments/inject-trust-anchor-hiera.yaml \
  -e ${THT_CUSTOM}/environments/enable-tls.yaml \
  -e ${THT_CUSTOM}/environments/sshd-banner.yaml \
  -e ${THT_CUSTOM}/environments/disable-telemetry.yaml \
  -e ${THT_CUSTOM}/environments/disable-swift.yaml \
  -e ${THT_CUSTOM}/environments/glance-nfs.yaml \
  -e ${THT_CUSTOM}/environments/cinder-nfs.yaml \
  -e ${THT_CUSTOM}/environments/ceph-config.yaml \
  -e ${THT_CUSTOM}/mariadb_strict_mode_fix.yaml \
  -e ${THT_CUSTOM}/containers-prepare-parameter.yaml \
  -e ${THT_CUSTOM}/upgrades-environment.yaml
