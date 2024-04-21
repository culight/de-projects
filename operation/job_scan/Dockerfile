FROM python:3.11-slim

ARG PROJECT_NAME

# Set the working directory in the container
WORKDIR /${PROJECT_NAME}

# Copy relevant files to the container
# operation
COPY operation/${PROJECT_NAME}/* /${PROJECT_NAME}/operation/
COPY operation/_common/* /${PROJECT_NAME}/operation/_common/
# orchestration
COPY orchestration/${PROJECT_NAME}/* /${PROJECT_NAME}/orchestration/
COPY orchestration/_common/* /${PROJECT_NAME}/orchestration/_common
# scripts
COPY scripts/${PROJECT_NAME}/* /${PROJECT_NAME}/scripts/
COPY scripts/_common/* /${PROJECT_NAME}/scripts/_common/
# tests
COPY tests/${PROJECT_NAME}/* /${PROJECT_NAME}/tests/
COPY tests/_common/* /${PROJECT_NAME}/tests/_common/
# pipeline
COPY pipeline.py /${PROJECT_NAME}/pipeline.py

# Install necessary python packages
# RUN pip install -r requirements.txt

# Install Google Cloud SDK and add to PATH
# RUN apt update && apt install -y curl && rm -rf /var/lib/apt/lists/*
# RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz
# RUN mkdir -p /usr/local/gcloud && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz && /usr/local/gcloud/google-cloud-sdk/install.sh

# ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin

