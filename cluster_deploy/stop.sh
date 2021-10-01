#!/bin/bash

source ./conf.ini

for REDIS_PORT in $(ls $ROOTDIR); do
redis-cli -h ${LOCAL_HOST} -p ${REDIS_PORT} -a ${REDIS_PSWD} -c shutdown
if [ 0 -eq $? ]; then
echo -e "\033[01;32mstop redis" $REDIS_PORT "success! \033[00m"
fi
done
