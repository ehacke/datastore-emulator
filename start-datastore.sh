#!/usr/bin/env bash

# Check user environment variable
if [[ -z "${DATASTORE_PROJECT_ID}" ]]; then
  echo "Missing DATASTORE_PROJECT_ID environment variable" >&2
  exit 1
fi

if [[ -z "${DATASTORE_LISTEN_ADDRESS}" ]]; then
  echo "Missing DATASTORE_LISTEN_ADDRESS environment variable" >&2
  exit 1
fi

# Config gcloud project
gcloud config set project ${DATASTORE_PROJECT_ID}

# Start emulator
gcloud beta emulators datastore start \
  --data-dir=/opt/data \
  --host-port=${DATASTORE_LISTEN_ADDRESS} \
  --no-store-on-disk --consistency=1.0
