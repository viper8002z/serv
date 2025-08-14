#!/bin/bash
# Directly run the panel binary without systemd check
/usr/local/x-ui/x-ui &
nginx -g "daemon off;"
