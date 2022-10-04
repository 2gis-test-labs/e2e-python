FROM python:3.10.7-slim-buster

LABEL maintainer="test-labs@2gis.ru"
LABEL source="https://github.com/2gis-test-labs/e2e-python"

ENV HOME=/home/ubuntu
ENV WORKDIR=/home/ubuntu/workdir

WORKDIR /tmp
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        git \
        curl \
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
    && echo 'echo "nano: not found, use micro instead"' > /usr/bin/nano \
    && chmod +x /usr/bin/nano

USER ubuntu
WORKDIR $WORKDIR
ENV EDITOR=micro

RUN python3 -m venv $HOME/.venv --upgrade-deps \
    && echo ". $HOME/.venv/bin/activate" >> $HOME/.bashrc \
    && mkdir -p $HOME/.config/micro \
    && echo '{"colorscheme": "solarized"}' > $HOME/.config/micro/settings.json
