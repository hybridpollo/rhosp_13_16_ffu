source /home/stack/stackrc
STACK_NAME=overcloud
openstack overcloud external-upgrade run --stack ${STACK_NAME} --tags system_upgrade_transfer_data

