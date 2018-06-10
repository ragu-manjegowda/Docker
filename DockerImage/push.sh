#!/bin/sh

#Check the arguments to configure openvpn as client or server
if [ $# -ne 2 ]
  then
    echo "argument error, usage: './push.sh username password' "
    exit 1
fi

dt=$(date '+%Y%m%d');

docker login -u=$1 -p=$2
docker tag baseimage:latest raag079/docker:latest
docker tag raag079/docker:latest raag079/docker:$dt

docker push raag079/docker:$dt
docker push raag079/docker:latest