FROM python:3.10-buster
# FROM python:3.10.5
# FROM python:3.10.5 AS build-stage

ARG DJANGO_ENV
ARG APP_VERSION

ENV APP_HOST 0.0.0.0
ENV APP_PORT 8000
ENV APP_WORKERS 1
ENV APP_WORKER_TIMEOUT 120

ENV DJANGO_ENV=${DJANGO_ENV} \
  PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONHASHSEED=random \
  PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  PIP_DEFAULT_TIMEOUT=100 \
  POETRY_VERSION=1.1.12

ENV WORKDIR=/app

RUN mkdir -p $WORKDIR/static

WORKDIR $WORKDIR

# RUN addgroup --system danil && adduser --system --no-create-home --group danil && \
#   chown -R danil:danil /usr && chmod -R 755 /usr
# USER danil
# COPY . /usr/src/app

#chown -R $(docker-compose exec SERVICE_NAME id -u) ./

COPY . $WORKDIR/
COPY . requirements.txt $WORKDIR/
RUN  python3 -m pip install -r requirements.txt 
RUN pip install poetry==$POETRY_VERSION
COPY . poetry.lock pyproject.toml $WORKDIR/
COPY . compose$WORKDIR/start.sh .


RUN ["chmod", "+x", "/app/start.sh"] && \ 
poetry config virtualenvs.create false && \
poetry install $(test "$DJANGO_ENV" == production && echo "--no-dev") --no-interaction --no-ansi && \
echo "$APP_VERSION" > $WORKDIR/.version

EXPOSE 8000

CMD ["/app/start.sh"]
