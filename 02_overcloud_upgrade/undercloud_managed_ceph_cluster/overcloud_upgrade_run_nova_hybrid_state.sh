source /home/stack/stackrc
STACK_NAME=overcloud
openstack overcloud upgrade run --stack ${STACK_NAME} --playbook upgrade_steps_playbook.yaml --tags nova_hybrid_state --limit all

