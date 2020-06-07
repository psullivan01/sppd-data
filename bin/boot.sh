#!/usr/bin/env sh

gunicorn -b 0.0.0.0:5000 $GUNICORN_CMD_ARGS sppd-data.app:app
