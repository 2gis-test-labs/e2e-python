FROM python:3.10.7-slim-buster

LABEL maintainer="test-labs@2gis.ru"
LABEL source="https://github.com/2gis-test-labs/e2e-python"

ENV HOME=/home/ubuntu
ENV WORKDIR=$HOME/workdir

WORKDIR /tmp
RUN apt update \
    && apt install -y --no-install-recommends \
        git \
        curl \
        nano \
        inetutils-ping \
    && rm -rf /var/lib/apt/lists/* \
    \
    && adduser --shell /bin/bash --disabled-password ubuntu --gecos ubuntu \
    && mkdir -p $WORKDIR \
    && chown ubuntu:ubuntu $WORKDIR \
    \
    && pip3 install --no-cache-dir --disable-pip-version-check --root-user-action=ignore --upgrade \
        pip \
        pip-tools \
    \
    && mkdir -p /venv \
    && chmod a+rwx /venv

USER ubuntu
WORKDIR $WORKDIR
ENV VENV_ENABLED=true \
    EDITOR=micro

RUN python3 -m venv /venv --upgrade-deps

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
