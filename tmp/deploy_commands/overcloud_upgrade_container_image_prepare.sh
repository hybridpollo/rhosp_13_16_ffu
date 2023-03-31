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

echo 'Running the overcloud container image prepare command.'

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

openstack overcloud external-upgrade run --stack overcloud --tags container_image_prepare
