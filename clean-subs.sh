#!/bin/bash

nodes=(
 "openshift-3"
 "openshift-node-1"
 "openshift-node-2"
 "openshift-etcd-1"
 "openshift-etcd-2"
);

for i in ${nodes[@]}; do
        echo ${i}
        ssh ${i} -c 'subscription-manager clean'
        ssh ${i} -C 'subscription-manager register --username=nlane@redhat.com --password=L1ghtandDay!'
        ssh ${i} -c 'subscription-manager attach --pool=8a85f9874182623c014193b03ffb1937'
done