ARG ELASTICSEARCH_VERSION=8.17.0
FROM elasticsearch:${ELASTICSEARCH_VERSION}

COPY elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
COPY --chmod=755 entrypoint.sh /usr/local/bin/entrypoint.sh

USER 0
RUN apt-get update && apt-get install -y sudo && \
    echo "elasticsearch ALL=(root) NOPASSWD: /bin/chown" > /etc/sudoers.d/elasticsearch
USER 1000:0

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]