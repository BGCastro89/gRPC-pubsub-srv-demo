# mongo_loader.rb
# Loads mongodb configuration.
# Q: How is this used in conjuction/relation to db.rake?

require 'mongoid'

class MongoLoader
  def self.load()
    Mongoid.configure do |config|
      config.clients.default = {
        hosts: 'mongodb://127.0.0.1:27017', # NOTE: Knova has this stored in env. var w/  ENV['mongodb_url']
        database: 'eventDb', #NOTE: Knova has this stored in env. var w/ ENV['db_name_prefix'] + org_key
      }
      config.log_level = :warn
    end
  end
end