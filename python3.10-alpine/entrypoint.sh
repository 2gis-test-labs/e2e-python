#!/bin/sh
set -e

trap : INT TERM

if [ "${VENV_ENABLED}" = "true" ] ; then
    . /venv/bin/activate
fi

"$@"
