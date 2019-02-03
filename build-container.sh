#!/usr/bin/env bash

echo $(git remote get-url origin)
USER=$(git remote get-url origin | tr '/' ':' | cut -d ':' -f 2)
docker build -t ${USER}/${CONTAINER} ${CONTAINER}/
