#!/bin/bash

# Start X-UI in background
x-ui start &

# Start Nginx in foreground
nginx -g "daemon off;"
