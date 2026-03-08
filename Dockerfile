ARG ELASTICSEARCH_VERSION=8.17.0
FROM elasticsearch:${ELASTICSEARCH_VERSION}

COPY elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
COPY --chmod=755 entrypoint.sh /usr/local/bin/entrypoint.sh

USER 0
RUN mkdir -p /esdata && chown -R 1000:0 /esdata
USER 1000:0

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]