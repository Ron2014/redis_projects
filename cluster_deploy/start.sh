#!/bin/bash

source ./conf.ini

ROOTDIR=cluster

for REDIS_PORT in ${list[@]}; do
pushd $ROOTDIR/$REDIS_PORT
redis-server ./redis.conf
if [ 0 -eq $? ]; then
echo -e "\033[01;32mstart redis" $REDIS_PORT "success! \033[00m"
fi
popd
done
