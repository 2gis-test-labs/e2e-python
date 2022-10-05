FROM python:3.10.7-alpine3.16

LABEL maintainer="test-labs@2gis.ru"
LABEL source="https://github.com/2gis-test-labs/e2e-python"

ENV HOME=/home/ubuntu
ENV WORKDIR=$HOME/workdir

WORKDIR /tmp
RUN apk add --no-cache \
        git \
        curl \
        micro \
    \
    && adduser -s /bin/sh -D ubuntu \
    && mkdir -p $WORKDIR \
    && chown ubuntu:ubuntu $WORKDIR \
    \
    && pip3 install --no-cache-dir --disable-pip-version-check --root-user-action=ignore --upgrade \
        pip \
        pip-tools \
    \
    && echo 'echo "nano: not found, use micro instead"' > /usr/bin/nano \
    && chmod +x /usr/bin/nano \
    \
    && mkdir -p /venv \
    && chmod a+rwx /venv

USER ubuntu
WORKDIR $WORKDIR
ENV VENV_ENABLED=true \
    EDITOR=micro

RUN python3 -m venv /venv --upgrade-deps \
    && mkdir -p $HOME/.config/micro \
    && echo '{"colorscheme": "solarized"}' > $HOME/.config/micro/settings.json

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
