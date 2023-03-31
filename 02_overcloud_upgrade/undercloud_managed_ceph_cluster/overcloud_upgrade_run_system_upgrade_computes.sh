source /home/stack/stackrc
STACK_NAME=overcloud
TARGET_HOST="osp-comp01,osp-comp02"
openstack overcloud upgrade run --stack ${STACK_NAME} --tags system_upgrade --limit ${TARGET_HOST}

