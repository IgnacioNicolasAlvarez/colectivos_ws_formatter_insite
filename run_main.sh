#!/bin/bash

podman run -d --env-file $PWD/.env localhost/colectivos_ws_formatter_insite:latest 