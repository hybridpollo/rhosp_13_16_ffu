source /home/stack/stackrc
STACK_NAME=overcloud
TARGET_HOST=osp-rhcs02
openstack overcloud external-upgrade run --stack ${STACK_NAME} --tags ceph_systemd -e ceph_ansible_limit=${TARGET_HOST}
