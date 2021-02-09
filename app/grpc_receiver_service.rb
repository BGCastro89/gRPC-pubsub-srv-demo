# grpc_receiver_service.rb
# Receiver Service acts as a middleman between the gRPC request and the internal logic of application.
# The service routes request to be performed/changed by logic in application code.
# It takes params of a defined event and direct it to the proper operation inside application logic
# Roguhly Speaking: (Protos and _pb files) => THIS FILE => receive_event.rb

# NOTE: Field/Attr Definitions here are... from proto?

require 'bundler/setup'
Bundler.require(:default)

require './lib/event_receiver_services_pb.rb'
require './app/operations.rb'
require './app/pubsub/pub.rb'

class GrpcReceiverService < Intro::EventReceiver::Service

  #=== METHODS ===#
  # One method for every operation in app/operations. In this case juse one.

  def receive_event(request, _call)
    # decoded_data = request.event_data.blank? ? {} : request.event_data #JSON.parse(request.event_data)

    #Event proto > _pb.rb > This Event::

    #TODO Where is call.metadata coming from, how populated, do I need it/same fields/data?
    service = Event::ReceiveEvent.new( #.new calls initialize method
      stakato_version_key: request.stakato_version_key,
      key: request.key,
      # event_key: request.event_key, #if choose to remove attr/param from proto, must remove it from here and down the line
      event_profile_key: request.event_profile_key,
      profile_id: request.profile_id,
      event_data: request.event_data,
      event_type_key: request.event_type_key,
    )
    
    result = service.perform

    pub = Publisher.new()
    pub.publish(result)

    Google::Protobuf::Empty.new

  end

# Hypothetical Operation, As reflected in .proto
# 
#  def  dance_event(request, _call)
#   service = Event::DanceEvent:.new(
#     data: request.data      
#   )
#   service.perform

#   # NOTE Somehow creates/has object cat, which is returned from operation as such
#   Intro::EventReceiver::cat
#     @cat

end