#!/bin/bash

datadir=$(echo $HDFS_CONF_dfs_datanode_data_dir | sed 's#file://##')

if [ ! -d "$datadir" ]; then
  echo "Datanode data directory not found: $datadir"
  exit 2
fi

hdfs datanode
