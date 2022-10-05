#!/bin/sh
set -e

trap : SIGINT SIGTERM

if [ "${VENV_ENABLED}" == "true" ] ; then
    source /venv/bin/activate
fi

exec "$@" & wait
