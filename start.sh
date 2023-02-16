#!/bin/bash
mkdir -p /var/log/apache2 2>/dev/null
apache2ctl start
if [ ! -f /var/www/html/index.php ]; then
	echo "<?php echo 'test'; ?>" > /var/www/html/index.php
fi
if [ ! -f /var/www/index.php ]; then
        echo "<?php echo 'test'; ?>" > /var/www/index.php
fi
tail -f /dev/null
