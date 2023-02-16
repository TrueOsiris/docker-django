#!/bin/bash
mkdir -p /var/log/apache2 2>/dev/null
apache2ctl start
tail -f /dev/null
