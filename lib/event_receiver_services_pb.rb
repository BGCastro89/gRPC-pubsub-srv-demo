# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: event_receiver.proto for package 'Intro'


# Created by running `grpc_tools_ruby_protoc -Iprotos --ruby_out=../lib --grpc_out=../lib protos/event_receiver.proto`

require 'grpc'
require './lib/event_receiver_pb'

module Intro
  module EventReceiver
    class Service

      include GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'Intro.EventReceiver'

      rpc :ReceiveEvent, ::Intro::EventObj, ::Google::Protobuf::Empty
    end

    Stub = Service.rpc_stub_class
  end
end
