FROM bde2020/hadoop-base:2.0.0-hadoop3.2.1-java8

LABEL maintainer="Jinhui Hong <jinhuih@andrew.cmu.edu>"

HEALTHCHECK CMD curl -f http://localhost:9870/ || exit 1

ENV HDFS_CONF_dfs_namenode_name_dir=file:///hadoop/dfs/name
ENV CLUSTER_NAME="my-hadoop-cluster"

RUN mkdir -p /hadoop/dfs/name
VOLUME /hadoop/dfs/name

COPY run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 9870

CMD ["/run.sh"]
