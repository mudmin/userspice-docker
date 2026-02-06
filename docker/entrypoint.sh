#!/bin/bash
set -e

# Only download and set up UserSpice if it hasn't been set up yet
if [ ! -d "/var/www/html/users" ]; then
    echo "UserSpice not found. Downloading latest release..."

    cd /tmp
    wget -q https://github.com/mudmin/releases/raw/master/latest.zip -O latest.zip
    unzip -q latest.zip -d /var/www/html

    # Delete the install folder so UserSpice doesn't show the installer
    rm -rf /var/www/html/install

    # Overwrite init.php with the Docker-configured version
    cp /docker/init.php /var/www/html/users/init.php

    # Clean up
    rm -rf /tmp/latest.zip

    # Set proper permissions
    chown -R www-data:www-data /var/www/html
    chmod -R 755 /var/www/html

    echo "UserSpice setup complete."
fi

# Start Apache in the foreground
exec apache2-foreground
