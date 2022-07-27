FROM python:3.10-buster
# FROM python:3.10.5
# FROM python:3.10.5 AS build-stage

ARG DJANGO_ENV
ARG APP_VERSION

ENV APP_HOST 0.0.0.0
ENV APP_PORT 8000
ENV APP_WORKERS 2
ENV APP_WORKER_TIMEOUT 120

ENV DJANGO_ENV=${DJANGO_ENV} \
  PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONHASHSEED=random \
  PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  PIP_DEFAULT_TIMEOUT=100 \
  POETRY_VERSION=1.1.12

RUN mkdir -p /app
WORKDIR /app

COPY requirements.txt /app/
RUN python3 -m pip install -r requirements.txt
RUN pip install poetry==$POETRY_VERSION

COPY compose/app/start.sh .
RUN ["chmod", "+x", "/app/start.sh"]
COPY poetry.lock pyproject.toml /app/

RUN poetry config virtualenvs.create false \
  && poetry install $(test "$DJANGO_ENV" == production && echo "--no-dev") --no-interaction --no-ansi

COPY . /app/
RUN echo "$APP_VERSION" > /app/.version
CMD ["/app/start.sh"]


# Install dependencies

# COPY requirements.txt .
# RUN pip install --user -r requirements.txt

# PRODUCTION STAGE
# Ensure logging is up to date despite possible buffering

# # WORKDIR /opt/app
# WORKDIR /usr/src/app

# # Move sourcefiles

# COPY requirements.txt ./
# RUN pip install --no-cache-dir -r requirements.txt
# COPY . .
# CMD [ "python", "./your-daemon-or-script.py" ]
# # Copy resources from build env
# # COPY --from=build-stage /root/.local/ /usr/local/
# # CMD ["/bin/bash"]