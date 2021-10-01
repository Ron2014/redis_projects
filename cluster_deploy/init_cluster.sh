#!/bin/bash

source ./conf.ini

master_list=
for NODE in ${NODELIST[@]}; do
master_list=$master_list\ NODE
done

echo $master_list
redis-cli -a $REDIS_PSWD --cluster create $master_list --cluster-replicas $REDIS_REPLICAS
