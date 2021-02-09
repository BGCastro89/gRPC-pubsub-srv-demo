# models.rb
# just imports all models into one place for easy access. In this case there is only 1 model anyway.

require 'bundler/setup'
# require 'mongoid' < unneeded?

Bundler.require(:default)

#require each file in models folder
Dir[File.expand_path './app/models/*.rb'].each do |file|
    require file
end