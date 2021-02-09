# receive_event.rb
# defines a single operation, recieve_event. Contains methods to initialize and carryout the operation on an instance of Event model

# NOTE: attr's here are those for.... ??? the model... i think

require 'bundler/setup'

Bundler.require(:default)
require './app/models.rb'
require './lib/mongo_loader.rb'

class Event::ReceiveEvent

    #Attrib
    attr_accessor :stakato_version_key, :key, :event_profile_key, :profile_id, :event_type_key, :event_data, :ruby_message, :event #:event_key,

    # NOTE: Creates a Event instance
    def initialize(stakato_version_key: nil, key: nil, event_profile_key: nil, profile_id: nil, event_type_key: nil, event_data: nil, ruby_message: nil) #event_key: nil, 
        
        MongoLoader.load()

        #Based on AE/VS/app/operations/event/validate_event_data.rb
        @stakato_version_key = stakato_version_key
        @key = key
        # @event_key = event_key
        @event_profile_key = event_profile_key
        @profile_id = profile_id
        @event_type_key = event_type_key
        @event_data = event_data
        @ruby_message = "I was added in ruby, not GRPC"
    end

    # NOTE: Performs action required by recieve event, in this case, create event repr. and save it to db
    def perform
        @event = Event.new(
            stakato_version_key: @stakato_version_key,
            key: @key,
            #event_key: @event_key,
            event_profile_key: @event_profile_key,
            profile_id: @profile_id,
            event_type_key: @event_type_key,
            event_data: @event_data,
            ruby_message: @ruby_message
        )
        @event.save
        @event
    end
end