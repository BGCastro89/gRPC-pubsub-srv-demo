# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: event_receiver.proto

# Created by running `grpc_tools_ruby_protoc -Iprotos --ruby_out=../lib --grpc_out=../lib protos/event_receiver.proto

require 'google/protobuf'

require 'google/protobuf/empty_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("event_receiver.proto", :syntax => :proto3) do
    add_message "Intro.EventObj" do
      optional :stakato_version_key, :string, 1
      optional :key, :string, 2
      optional :event_key, :string, 3
      optional :event_profile_key, :string, 4
      optional :profile_id, :string, 5
      optional :event_type_key, :string, 6
      optional :event_data, :string, 7
    end
  end
end

module Intro
  EventObj = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("Intro.EventObj").msgclass
end