#! /usr/bin/env sh
set -e
python ads_validator/manage.py collectstatic --clear --no-input -v 0
python ads_validator/manage.py migrate
exec gunicorn core.wsgi:application --bind "${APP_HOST}":"${APP_PORT}" --workers "${APP_WORKERS}" --timeout "${APP_WORKER_TIMEOUT}"