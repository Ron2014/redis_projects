#!/bin/bash

source ./conf.ini

alias cp=cp

for REDIS_PORT in ${list[@]}; do
mkdir -p $ROOTDIR/$REDIS_PORT
filename=$ROOTDIR/$REDIS_PORT/redis.conf
cp -f redis.conf.tpl $filename
fmt='s/${REDIS_HOST}/'${REDIS_HOST}'/g' 
sed -i "$fmt" $filename
fmt='s/${REDIS_PORT}/'${REDIS_PORT}'/g' 
sed -i "$fmt" $filename
fmt='s/${REDIS_PSWD}/'${REDIS_PSWD}'/g' 
sed -i "$fmt" $filename
done
