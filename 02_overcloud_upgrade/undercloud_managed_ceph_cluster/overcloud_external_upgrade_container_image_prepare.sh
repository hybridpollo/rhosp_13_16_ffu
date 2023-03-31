source /home/stack/stackrc
STACK_NAME=overcloud
openstack overcloud external-upgrade run --stack ${STACK_NAME} --tags container_image_prepare
