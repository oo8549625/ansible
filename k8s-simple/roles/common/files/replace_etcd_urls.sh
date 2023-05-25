#!/bin/bash

CONFIG_PATH=roles/common/files/etcd-config.yaml
SOURCES=($(awk '/etcd:/ {etcd_flag=1; next} etcd_flag && /host:/ {host_flag=1; next} host_flag && /\s*- / {gsub(/[-" ]/, "", $0); print}' ${CONFIG_PATH}))
IFS=',' read -ra TARGETS <<< "$1"

if [ ${#TARGETS[@]} -ne ${#SOURCES[@]} ]; then
  echo "Error: Number of targets doesn't match the number of sources."
  exit 1
fi

for index in "${!SOURCES[@]}"; do
    echo SOURCES[$index]
    # macos
    sed -i "" "s~${SOURCES[$index]}~${TARGETS[$index]}~" ${CONFIG_PATH}
    # linux
    # sed -i "s~${SOURCES[$index]}~${TARGETS[$index]}~" ${CONFIG_PATH}
done