#!/bin/bash
# # This is executed from within the director
# Example execution run excluding the repo validation run
# that check is not required for systems that are not subscribed to rhsm
# openstack action execution run tripleo.validations.list_validations '{"groups": ["pre-upgrade"]}' | jq '.result[] | select(.id |  contains("repo") | not ) | .id'
# 

for VALIDATION in $(openstack action execution run tripleo.validations.list_validations '{"groups": ["pre-upgrade"]}' | jq '.result[] | select(.id |  contains("repo") | not ) | .id')
do
  echo "=== Running validation: $VALIDATION ==="
  STACK_NAME=$(openstack stack list -f value -c 'Stack Name')
  ID=$(openstack workflow execution create -f value -c ID tripleo.validations.v1.run_validation "{\"validation_name\": $VALIDATION, \"plan\": \"$STACK_NAME\"}")
  while [ $(openstack workflow execution show $ID -f value -c State) == "RUNNING" ]
  do
    sleep 1
  done
  echo ""
  openstack workflow execution output show $ID | jq -r ".stdout"
  echo ""
done
