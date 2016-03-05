#!/bin/bash

if [[ $# -eq 0 ]]; then
  exec java -jar target/service-jar-with-dependencies.jar
else
  exit 0
fi
