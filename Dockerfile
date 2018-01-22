FROM flink:latest

COPY docker-entrypoint-s3.sh /
ENTRYPOINT ["/docker-entrypoint-s3.sh"]
CMD ["help"]
