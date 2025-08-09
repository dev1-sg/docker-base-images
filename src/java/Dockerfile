# syntax=docker.io/docker/dockerfile:1

FROM docker.io/ubuntu:24.04 AS base

ARG ARCH=amd64
ARG JAVA_VERSION=21

USER root

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    sudo bash git curl ca-certificates jq locales \
    ca-certificates-java openjdk-${JAVA_VERSION}-jdk-headless maven \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen en_US.UTF-8

ENV TZ=Asia/Singapore \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8 \
    JAVA_HOME=/usr/lib/jvm/java-${JAVA_VERSION}-openjdk-${ARCH}

ENV PATH="$JAVA_HOME/bin:$PATH"
