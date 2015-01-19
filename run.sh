#!/bin/sh

if [ $# -lt 1 ]; then
  echo "Usage: ./run.sh MakeAPassword"
  exit 1
fi
docker run -d \
  --name techlunch \
  -p 443:8888 \
  -v $PWD:/notebooks/:rw \
  --privileged=true \
  -e "PASSWORD=$1" \
  thewtex/kitware-techlunch-docker
