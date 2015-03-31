#!/bin/bash

echo "installing" > /var/log/container_status

mkdir -p /srv/django
cp -r /srv/code /srv/django/app
chown -R www-data:www-data /srv/django/app
/usr/bin/supervisord

echo "complete" > /var/log/container_status