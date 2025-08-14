#!/bin/bash
/usr/local/x-ui/x-ui &
sleep 3
nginx -g "daemon off;"
