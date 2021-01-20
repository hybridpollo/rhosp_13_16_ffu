# This is executed from within the director
# to easily gather the inventory from the deployment
# plan
source ~/stackrc
tripleo-ansible-inventory --static-yaml-inventory overcloud-inventory.yaml
