#!/bin/bash

# Start X-UI in foreground
x-ui start --no-daemon &

# Start Nginx in foreground
nginx -g "daemon off;"
