# pub.rb
# Custom made, not part of grpc service. 
# Makes a connection to Mock local Pub/Sub Server, and publishes event to it.

require "google/cloud/pubsub"
require 'json'

class Publisher
    def publish(event)

        puts ">>> publishing..."
        pubsub = Google::Cloud::PubSub.new(
            project_id: "grpc-demo-proj",
            emulator_host: "localhost:8085"
        )

        topic = pubsub.topic "event_topic" #NOTE: equivilant to .topic("event_topic") in Ruby

        begin
            topic.publish_async "receive_event#event", #NOTE:  This string appears as "data: xxxx" in message pulled from P/S
                    event: JSON.generate(event) do |result| #NOTE:  appears as "attributes: { event: xxxx}" in message pulled from P/S
                raise "Failed to publish the message." unless result.succeeded?
                puts ">>>  Message published asynchronously."
            end

            # Stop the async_publisher to send all queued messages immediately.
            topic.async_publisher.stop.wait!
            rescue StandardError => e
            puts ">>> Received error while publishing: #{e.message}"
        end
    end
end
