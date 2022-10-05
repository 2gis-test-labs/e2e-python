FROM 2gistestlabs/e2e-python:3.10-alpine

ONBUILD WORKDIR $HOME
ONBUILD COPY requirements.txt ./
ONBUILD RUN pip-sync \
                --python-executable /venv/bin/python3 \
                --pip-args "--no-cache-dir --disable-pip-version-check" \
            && rm requirements.txt

ONBUILD WORKDIR $WORKDIR
ONBUILD COPY --chown=ubuntu:ubuntu . $WORKDIR
