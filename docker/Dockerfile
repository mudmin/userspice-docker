# Use the official PHP image with Apache
FROM php:8.1-apache

# Install MySQL extension and other dependencies
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable mod_rewrite for Apache
RUN a2enmod rewrite

# Copy your UserSpice files to the Apache document root
COPY ./userspice /var/www/html

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

# Expose port 80
EXPOSE 80
