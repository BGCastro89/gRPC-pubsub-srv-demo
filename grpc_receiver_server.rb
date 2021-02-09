#!/usr/bin/env ruby

# grpc_receiver_Service
# run from this file. Kicks off the service.

require 'rubygems'
require 'bundler/setup' #bundler library
#NOTE: Bundler.require() sets up simlinks from project to each individual gem as defined for user
Bundler.require(:default) 

require 'grpc'
require 'logging'
require './app/grpc_receiver_service.rb'

module GRPC
  extend Logging.globally
end

#=== LOGGING SETTINGS ===#

Logging.logger.root.appenders = Logging.appenders.stdout
Logging.logger.root.level = :info

#=== SERVER CLASS ===#

class ReceiverServer

  class << self
    def start
      start_grpc_server
    end

    private

    def start_grpc_server

      GRPC.logger.info("Starting...")
      address = "127.0.0.1:1701"
      server = GRPC::RpcServer.new
      GRPC.logger.info("Adding Port...")
      server.add_http2_port(address, :this_port_is_insecure)
      GRPC.logger.info("Handling...")
      server.handle(GrpcReceiverService.new)
      GRPC.logger.info("Server running insecurely on #{address}")
      server.run_till_terminated
    end
  end

end

#=== SERVER LAUNCH ===#

ReceiverServer.start