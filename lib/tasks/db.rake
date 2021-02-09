# db.rake
# Used to create/delete DB

# Q: How is this used in conjuction/relation to db.rake?

require 'mongo'
# In Development:
# Uncomment this line to filter the mongodb log's output to the terminal 
# Mongo::Logger.logger.level = ::Logger::DEBUG
# Note: (Logger level determines output information)

namespace :db do
  desc 'Create database'
  task :create do
        # Set up DB
        db_instance = "eventDb" # set DB name
        client = Mongo::Client.new(["127.0.0.1:27017"], :database => db_instance) # Set path to DB
        db = client.database

        # Set up Collection (like a table in SQL)
        collection_name = "events" # set name of collection 
        collection = client[collection_name]
        collection.create
        db.collection(collection_name)

        # Create DB as defined above
        Mongo::Database.create(client)
        puts (db_instance + ' Database created.')
        end
    end

  desc 'Delete database'
  task :drop do
      
      db_instance = "eventDb"# set DB name
      client = Mongo::Client.new(["127.0.0.1:27017"], :database => db_instance) #Set path to DB

      db = client.database.drop
      puts (db_instance + ' Database Deleted.')
    end
