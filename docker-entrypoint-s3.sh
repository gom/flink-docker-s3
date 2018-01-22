#!/bin/sh
##
# $FLINK_HOME is defined by Dockerfile.
# $FLINK_S3_* will be defined when the container start.

if [ -n "$FLINK_S3_ACCESS_KEY" ]; then
  echo "s3.access-key: ${FLINK_S3_ACCESS_KEY}" >> "$FLINK_HOME/conf/flink-conf.yaml"
fi

if [ -n "$FLINK_S3_SECRET_KEY" ]; then
  echo "s3.secret-key: ${FLINK_S3_SECRET_KEY}" >> "$FLINK_HOME/conf/flink-conf.yaml"
fi

# https://ci.apache.org/projects/flink/flink-docs-release-1.4/ops/deployment/aws.html#shaded-hadooppresto-s3-file-systems-recommended
cp $FLINK_HOME/opt/flink-s3-fs-presto-1.4.0.jar $FLINK_HOME/lib/

exec /docker-entrypoint.sh $@
