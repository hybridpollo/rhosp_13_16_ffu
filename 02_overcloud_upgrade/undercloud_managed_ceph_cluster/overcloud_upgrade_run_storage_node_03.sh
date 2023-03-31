source /home/stack/stackrc
STACK_NAME=overcloud
TARGET_HOST=osp-rhcs03
openstack overcloud upgrade run --stack ${STACK_NAME} --limit ${TARGET_HOST}
