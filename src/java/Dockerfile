# syntax=docker.io/docker/dockerfile:1

FROM docker.io/eclipse-temurin:24.0.1_9-jre-noble AS java
FROM docker.io/ubuntu:24.04 AS base

USER root

ENV TZ=Asia/Singapore \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8 \
    JAVA_HOME=/opt/java/openjdk

ENV PATH="/opt/java/openjdk/bin:${PATH}"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    sudo bash git curl ca-certificates jq locales-all \
    maven \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

FROM base AS final

COPY --from=java /opt/java /opt
