require 'bundler/setup'
Bundler.require

require "sinatra/activerecord"
require 'rake'
# require 'app/models'

ENV["PLAYLISTER_ENV"] ||= "development"

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

connection_details = YAML::load(File.open('config/database.yml'))

ActiveRecord::Base.establish_connection(connection_details)
ActiveRecord::Base.logger = nil

if ENV["PLAYLISTER_ENV"] == "test"
    ActiveRecord::Migration.verbose = false
  end