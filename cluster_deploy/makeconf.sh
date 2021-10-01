#!/bin/bash

source ./conf.ini

alias cp=cp

for NODE in ${NODELIST[@]}; do
NODEARR=(${NODE//:/ })
REDIS_HOST=${NODEARR[0]}
REDIS_PORT=${NODEARR[1]}
echo $NODE $REDIS_HOST $REDIS_PORT
if [ "$REDIS_HOST" == "$LOCAL_HOST" ]; then
mkdir -p $ROOTDIR/$REDIS_PORT
filename=$ROOTDIR/$REDIS_PORT/redis.conf
cp -f redis.conf.tpl $filename
fmt='s/${REDIS_HOST}/'${REDIS_HOST}'/g' 
sed -i "$fmt" $filename
fmt='s/${REDIS_PORT}/'${REDIS_PORT}'/g' 
sed -i "$fmt" $filename
fmt='s/${REDIS_PSWD}/'${REDIS_PSWD}'/g' 
sed -i "$fmt" $filename
fi
done
