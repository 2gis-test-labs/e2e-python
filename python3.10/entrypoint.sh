#!/bin/sh
set -e

if [ "${VENV_ENABLED}" == "true" ] ; then
    source /venv/bin/activate
fi

exec "$@"
