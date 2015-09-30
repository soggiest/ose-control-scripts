#!/bin/bash

nodes=(
 "openshift-2"
 "openshift-3"
 "openshift-node-1"
 "openshift-node-2"
 "openshift-etcd-1"
 "openshift-etcd-2"
);

for i in ${nodes[@]}; do
        echo ${i}
        ssh ${i} -C ' yum -y remove openshift openshift-* etcd docker'
		ssh ${i} -C 'rm -rf /etc/openshift /var/lib/openshift /etc/etcd /var/lib/etcd /etc/sysconfig/openshift* /etc/sysconfig/docker* /root/.kube/config /etc/ansible/facts.d /usr/share/openshift' 
done

