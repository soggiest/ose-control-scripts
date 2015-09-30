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
        ssh ${i} -C 'subscription-manager repos --disable="*"'
        ssh ${i} -C 'subscription-manager repos --enable=\:"rhel-7-server-rpms\" --enable=\"rhel-7-server-extras-rpms\" --enable=\"rhel-7-server-ose-3.0-rpms --enable=\"rhel-ha-for-rhel-7-server-rpms\"'
done