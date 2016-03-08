#!/bin/bash

if [[ $# -eq 0 ]]; then
  exec java -jar target/service-jar-with-dependencies.jar
fi

case "$1" in
  deploy)
    exit 0
  ;;
  *)
    exit 0
  ;;
esac
