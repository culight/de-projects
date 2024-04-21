FROM python:3.11-slim

ARG PROJECT_NAME

# Install necessary python packages
COPY . ./

RUN pip install -r requirements.txt

# Install Google Cloud SDK and add to PATH
RUN apt update && apt install -y curl && rm -rf /var/lib/apt/lists/*
RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz
RUN mkdir -p /usr/local/gcloud && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz && /usr/local/gcloud/google-cloud-sdk/install.sh

ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin