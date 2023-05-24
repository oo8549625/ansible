#!/bin/bash

SOURCES=($(awk '/^etcd:/ {flag=1; next} flag && /^    - / {gsub(/"/, "", $0); print substr($0, 7)}' roles/common/files/etcd-config.yaml))
IFS=',' read -ra TARGETS <<< "$1"

if [[ ${#TARGETS[@]} -ne ${#SOURCES[@]} ]]; then
  echo "Error: Number of targets doesn't match the number of sources."
  exit 1
fi

for index in "${!SOURCES[@]}"; do
    sed -i "" "s~${SOURCES[$index]}~${TARGETS[$index]}~" roles/common/files/etcd-config.yaml
done