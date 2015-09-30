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
        scp /etc/resolv.conf ${i}:/etc/resolv.conf
done
