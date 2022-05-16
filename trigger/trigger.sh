#!/bin/bash

if [[ ! `docker ps -a | awk '{print $NF}' | grep closet_dd` ]]
then 
	docker run -p 8000:8000 -d -v $HOME/ip_vol:/ip_vol --name closet_dd m1v1n/closet_dojo
fi

if [[ ! `docker ps -a | awk '{print $NF}' | grep closet_octant` ]]
then
	docker run -v $HOME/kubeconfig:/kubeconfig -p 7777:7777 -d --name closet_octant m1v1n/octant
fi


docker run -v /var/run.docker.sock:/var/run/docker.sock -v <config_dir>:/root/config -e REPO='' -d m1v1n/closet_start
