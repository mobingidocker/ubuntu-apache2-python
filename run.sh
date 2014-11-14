#!/bin/bash

mkdir -p /srv/django
cp -r /srv/code /srv/django/app
chown -R www-data:www-data /srv/django/app
/usr/bin/supervisord
