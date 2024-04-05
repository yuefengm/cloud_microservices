#!/bin/bash

namedir=$(echo $HDFS_CONF_dfs_namenode_name_dir | sed 's#file://##')

if [ ! -d "$namedir" ]; then
  echo "Namenode name directory not found: $namedir"
  exit 2
fi

if [ -z "$CLUSTER_NAME" ]; then
  echo "Cluster name not specified"
  exit 2
fi

if [ -d "$namedir/lost+found" ]; then
  echo "Removing lost+found from $namedir"
  rm -r "$namedir/lost+found"
fi

if [ -z "$(ls -A $namedir)" ]; then
  echo "Formatting namenode name directory: $namedir"
  hdfs namenode -format $CLUSTER_NAME -force
fi

hdfs namenode
