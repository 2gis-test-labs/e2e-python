#!/bin/bash
set -e

trap : INT TERM

if [ "${VENV_ENABLED}" == "true" ] ; then
    source /venv/bin/activate
fi

"$@"
