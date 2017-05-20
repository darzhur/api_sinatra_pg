require 'sinatra'
require './lib/tasks/db'

namespace :db do
  task :environment do
    require 'sequel'
    ENV['DATABASE_URL'] ||= 'postgres://admind:password@localhost/api_sinatra'
    ENV['RACK_ENV'] ||= 'development'
    ENV['DATABASE'] = 'api_sinatra_development' if ENV['RACK_ENV'] == 'development'
    ENV['DATABASE'] = 'api_sinatra_test' if ENV['RACK_ENV'] == 'test'
    ENV['DATABASE'] = 'api_sinatra_production' if ENV['RACK_ENV'] == 'production'
  end
end
