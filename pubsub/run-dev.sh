#!/bin/bash

# Kill the existing process if it's already running
if [ "$(lsof -i:8085)" ]; then
  kill $(lsof -t -i:8085)
fi

# Kick off the new process
gcloud beta emulators pubsub start --project=grpc-demo-proj

# Connect to environment variables
$(gcloud beta emulators pubsub env-init)
