FROM python:3.10.5 AS build-stage

# Install dependencies
COPY requirements.txt .
RUN pip install --user -r requirements.txt


# PRODUCTION STAGE
FROM python:3.10.5

# Ensure logging is up to date despite possible buffering
ENV PYTHONUNBUFFERED 1

WORKDIR /opt/app

# Move sourcefiles
COPY . .
# Copy resources from build env
COPY --from=build-stage /root/.local/ /usr/local/


CMD ["/bin/bash"]