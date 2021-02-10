# This is executed from within the Undercloud
# to easily gather the overcloud inventory from the deployment
# plan
source ~/stackrc
tripleo-ansible-inventory --static-yaml-inventory overcloud-inventory.yaml
