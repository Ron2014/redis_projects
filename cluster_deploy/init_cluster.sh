#!/bin/bash

source ./conf.ini

master_list=
for REDIS_PORT in ${list[@]}; do
master_list=$master_list\ $REDIS_HOST:$REDIS_PORT
done

echo $master_list
redis-cli -a $REDIS_PSWD --cluster create $master_list --cluster-replicas $REDIS_REPLICAS
