# operations.rb
# just imports all operations into one place for easy access. In this case there is only 1 operation anyway.

require 'bundler/setup'

Bundler.require(:default)

Dir[File.expand_path './app/operations/*.rb'].each do |file|
  require file
end