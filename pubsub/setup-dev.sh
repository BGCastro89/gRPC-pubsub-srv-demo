#!/bin/bash

# Wait for the pubsub emulator to boot up
sleep 7
while [[ ! "$(lsof -i:8085)" ]]
do
  echo '#===> PUBSUB EMULATOR SETUP: Waiting for PubSub Emulator to start...'
  sleep 3
done

  # Create topics
curl --header "Content-Type: application/json" \
  --request PUT \
  http://localhost:8085/v1/projects/grpc-demo-proj/topics/event_topic


# Create test subscriptions for each topic
curl --header "Content-Type: application/json" \
  --request PUT \
  --data '{"topic": "projects/grpc-demo-proj/topics/event_topic"}' \
  http://localhost:8085/v1/projects/grpc-demo-proj/subscriptions/event_topic.test_sub1


# NOTE: Example of a Subscription w/ pushConfig/Endpoint - makes it a PUSH sub, instead of default PULL
# --data '{"topic": "projects/knova-dev-project/topics/artifact_engine_internal_topic", "pushConfig": {"pushEndpoint": "http://localhost:3210/process_message"}}' \
# 

echo ''
echo '#===> PUBSUB EMULATOR SETUP: Emulator setup complete!'
