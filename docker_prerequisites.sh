#!/bin/bash

nodes=(
 "172.16.0.193"
 "172.16.0.195"
 "172.16.0.201"
 "172.16.0.202"
 "172.16.0.203"
 "172.16.0.204"
);

for i in ${nodes[@]}; do
        echo ${i}
        ssh ${i} -C 'yum -y install docker' 
        ssh ${i} -C 'if ! grep -qe--insecure-registry\ 172.16.0.0/30 /etc/sysconfig/docker; then sed "s/--selinux-enabled/--selinux-enabled --insecure-registry 172.16.0.0\/30/" /etc/sysconfig/docker > /tmp/docker_replace; mv /tmp/docker_replace /etc/sysconfig/docker; fi'
        ssh ${i} -C 'cat <<EOF > /etc/sysconfig/docker-storage-setup
DEVS=/dev/vdc
VG=docker-storage
EOF'
		ssh ${i} -C 'docker-storage-setup'
done



