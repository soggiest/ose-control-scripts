#!/bin/bash

#You must enter your own username and passwords below

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
        ssh ${i} -C 'subscription-manager register --username=********* --password=***************'
        ssh ${i} -c 'subscription-manager attach --pool=8a85f9874182623c014193b03ffb1937'
done
