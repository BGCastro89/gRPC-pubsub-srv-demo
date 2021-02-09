# event.rb
# Defines the Event model, which is a data object. 
# Field Definitions below are those used for operation recieve_event, not nessecerially as defined in proto.
# MUST have all fields from grpc_receiver_service, but can add additonal ones
# Operation MUST match all fields listed here.

require 'mongoid'

# NOTE:Creates Event model, 
class Event # < ActiveRecord::Base, # NOTE: < means Inherts ActiveRecord, which has attribute Base. But not using it now.
  include Mongoid::Document
  include Mongoid::Timestamps

  #==== CONSTANTS ====#

  MAX_STRING_LENGTH = 300
  MAX_SCHEMA_LENGTH = 20
  CURRENT_SCHEMA_VERSION = 'stakato.event.s1'

  #==== MONGOID DOCUMENT FIELDS ====#

  # NOTE: can have extra fields in model than grpc <--------------------
  #field :type, type: String
  field :stakato_version_key, type: String
  field :key, type: String
  # field :event_key, type: String # This field was removed from proto data in grpc_receiver_service
  field :event_profile_key, type: String
  field :profile_id, type: String
  field :event_data, type: String, default: {}
  field :event_type_key, type: String
  field :ruby_message, type: String # This field is now being added, post-grpc_receiver_service.
  

    
  #==== INSTANCE METHODS ====#

  # NOTE: For when you do return something... but not doing that here
  # def to_proto
  #   # Event.new(
  #   #   schema: schema,
  #   #   stakato_version_key: stakato_version_key,
  #   #   key: key,
  #   #   event_key: event_key,
  #   #   event_profile_key: event_profile_key, 
  #   #   profile_id: profile_id, 
  #   #   type: type,
  #   #   timestamp: timestamp.to_s,
  #   #   event_data: JSON.generate(event_data),
  #   # )
  # end
end
