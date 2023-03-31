#!/usr/bin/env bash
#
###################################################
# Variables
###################################################
THT_DEFAULT="/usr/share/openstack-tripleo-heat-templates"
THT_CUSTOM="/home/stack/overcloud_deployment/templates"
RC_FILE="/home/stack/stackrc"
TARGET_HOSTS="osp-ctrl01,osp-ctrl02,osp-ctrl03"
STACK_NAME="overcloud"

if [[ $USER != "stack" ]]; then
  echo -e "ERROR: Deploy script  must be run as the stack user."
  exit 1
fi

echo "Running the OSP13->OSP16 upgrade on ${TARGET_HOSTS}"

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

openstack overcloud upgrade run -y --stack ${STACK_NAME} --limit ${TARGET_HOSTS} 
