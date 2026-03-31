#!/usr/bin/env bash

while IFS= read -r path; do
  if [ -d "$path" ]; then
    echo "$path"
  elif [ -f "$path" ]; then
    dirname "$path"
  fi
done
