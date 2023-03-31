source /home/stack/stackrc
STACK_NAME=overcloud
TARGET_HOST="osp-ctrl01,osp-ctrl02,osp-ctrl03"
openstack overcloud upgrade run --stack ${STACK_NAME} --limit ${TARGET_HOST}
