FROM ghcr.io/n8n-io/n8n:2.0.0

USER root

COPY --chown=node:node start.sh /start.sh
RUN chmod 755 /start.sh

USER node

EXPOSE 5678

ENTRYPOINT ["/start.sh"]
