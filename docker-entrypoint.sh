#!/bin/bash

if [[ $# -eq 0 ]]; then
  exec java -jar target/service-jar-with-dependencies.jar
fi

case "$1" in
  deploy)
    eval $(<./client-bundle/env.sh)
    docker-compose up -d
  ;;
  *)
    exit 0
  ;;
esac
