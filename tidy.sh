#!/bin/bash

fileName="$1"

if [ -z "$fileName" ]; then
  echo "No zip file mentioned."
  exit 1
fi

case "$fileName" in
*.zip)
  unzip "$fileName"
  status=$?

  if [ $status -eq 0 ]; then
    rm "$fileName"
    echo "$fileName unzipped."
    echo "$fileName removed."
  else
    exit 1
  fi
  ;;
esac
