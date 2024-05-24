FROM python:3.12-slim

ARG PROJECT_NAME

# Set the working directory in the container
WORKDIR /${PROJECT_NAME}

COPY ${PROJECT_NAME}/operation/requirements.txt ./
RUN pip install -r requirements.txt

# Copy relevant files to the container
# operation
COPY ${PROJECT_NAME}/operation/* /${PROJECT_NAME}/operation/
COPY _common/operation/* /${PROJECT_NAME}/operation/_common/
# orchestration
COPY ${PROJECT_NAME}/orchestration/* /${PROJECT_NAME}/orchestration/
COPY _common/orchestration/* /${PROJECT_NAME}/orchestration/_common
# scripts
COPY ${PROJECT_NAME}/scripts/* /${PROJECT_NAME}/scripts/
COPY _common/scripts/* /${PROJECT_NAME}/scripts/_common/
# tests
COPY ${PROJECT_NAME}/tests/* /${PROJECT_NAME}/tests/
COPY _common/tests/* /${PROJECT_NAME}/tests/_common/
# pipeline
COPY pipeline.py /${PROJECT_NAME}/pipeline.py

# Install Google Cloud SDK and add to PATH
# RUN apt update && apt install -y curl && rm -rf /var/lib/apt/lists/*
# RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz
# RUN mkdir -p /usr/local/gcloud && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz && /usr/local/gcloud/google-cloud-sdk/install.sh

# ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin

