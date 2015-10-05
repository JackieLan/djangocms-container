#!/bin/bash

set -e

MODULE=${MODULE:-myapp}

sed -i "s/module=myapp:application/module=${MODULE}.wsgi:application/g" /django/uwsgi.ini

if [ ! -f "/django/app/manage.py" ]
then
  django-admin.py startproject ${MODULE} /django/app/
fi

exec /usr/bin/supervisord
