# Google Cloud PubSub Emulator #

## Running PubSub Emulator ##

- To run the emulator use `./run-dev.sh`
- Since the emulator loses all of its server state each time it is shut down, you will need to re create topics, subscriptions, etc after each run. To do that use `./setup-dev.sh`

## Docs ##

The documentation for the emulator itself is here:
- [Testing apps locally with the emulator](https://cloud.google.com/pubsub/docs/emulator)
- [Emulator CLI Docs](https://cloud.google.com/sdk/gcloud/reference/beta/emulators/pubsub/start)

The virtual project id used by the emulator is `grpc-demo-proj`.

The way the emulator works is that it creates a server on localhost that responds to restful API requests as if it were the Google Cloud PubSub API. So you can use postman to interact with this server (on port 8085) following the documentation here: [Cloud Pub/Sub API](https://cloud.google.com/pubsub/docs/reference/rest).

Note: The virtual pubsub server loses all of its state when it shuts down. So you will need to recreate topics / subscriptions / etc every single time the dev environment is launched. (Right now this happens in `run-dev.sh`.)

## Example Commands ##

## Publishing a message ##

From the command line:

```
curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"messages": [{"data": "test", "attributes": {"key1": "value1", "key2": 2}}]}' \
  http://localhost:8085/v1/projects/grpc-demo-proj/topics/event:publish
```

NOTE: The `data` key has to be base64 encoded, which is tricky to do from the command line, so maybe avoid using the command line to do real testing.