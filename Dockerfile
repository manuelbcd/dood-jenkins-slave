ARG ALPINE_VERSION=latest

FROM alpine:$ALPINE_VERSION AS downloader

ARG DOCKER_CLIENT_VERSION=18.06.0
RUN apk add --no-cache curl \
    && curl -sSL -o docker.tgz https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_CLIENT_VERSION-ce.tgz \
    && tar xzvf docker.tgz

FROM alpine:$ALPINE_VERSION
COPY --from=downloader /docker/docker /bin/docker
