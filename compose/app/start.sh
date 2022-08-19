#! /usr/bin/env sh
set -e
python3 manage.py collectstatic --clear --no-input -v 0
python3 manage.py migrate
exec gunicorn ads_validator.wsgi
exec gunicorn --env DJANGO_SETTINGS_MODULE=ads_validator.settings ads_validator.wsgi
exec gunicorn core.wsgi:application --bind "${APP_HOST}":"${APP_PORT}" --workers "${APP_WORKERS}" --timeout "${APP_WORKER_TIMEOUT}"