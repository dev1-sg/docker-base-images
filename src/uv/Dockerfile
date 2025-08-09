# syntax=docker.io/docker/dockerfile:1

FROM docker.io/ubuntu:24.04 AS base

USER root

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    sudo bash git curl ca-certificates jq locales \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen en_US.UTF-8

ENV TZ=Asia/Singapore \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

FROM base AS final

ARG PYTHON_VERSION=3.13.5

ENV UV_INSTALL_DIR=/usr/local/bin \
    UV_PYTHON_INSTALL_DIR=/opt/uv \
    UV_PYTHON_BIN_DIR=/usr/local/bin \
    UV_TOOL_DIR=/opt/uv/tool \
    UV_TOOL_BIN_DIR=/usr/local/bin

RUN mkdir -p /opt/uv /opt/uv/tool \
    && curl -fsSL https://astral.sh/uv/install.sh | bash \
    && uv python install "${PYTHON_VERSION}" --default
