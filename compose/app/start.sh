#! /usr/bin/env sh
set -e
python manage.py collectstatic --clear --no-input -v 0
python manage.py migrate
exec gunicorn core.wsgi:application --bind "${APP_HOST}":"${APP_PORT}" --workers "${APP_WORKERS}" --timeout "${APP_WORKER_TIMEOUT}"