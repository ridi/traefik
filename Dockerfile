FROM haproxy:alpine

RUN apk add --no-cache --virtual .run-deps \
    ca-certificates bash wget openssl \
    && touch /var/run/haproxy.pid

ENV DOCKER_GEN_VERSION 0.7.4
RUN wget --quiet https://github.com/jwilder/docker-gen/releases/download/$DOCKER_GEN_VERSION/docker-gen-alpine-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
    && tar -C /usr/local/bin -xvzf docker-gen-alpine-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
    && rm /docker-gen-alpine-linux-amd64-$DOCKER_GEN_VERSION.tar.gz

ENV DOCKER_HOST unix:///tmp/docker.sock

WORKDIR /app
ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["docker-gen", "-config", "docker-gen.cfg"]