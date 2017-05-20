#API
require 'sinatra'
require 'sinatra/namespace'
require 'sinatra/base'
require 'sequel'
require 'sequel/extensions/seed'
# require 'pg'
# require 'json'
# require 'multi_json'


%w{controllers models routes}.each {|dir| Dir.glob("./#{dir}/*.rb", &method(:require))}

DB = Sequel.connect(
    adapter: :postgres,
    database: 'api_sinatra_development',
    host: 'localhost',
    password: 'password',
    user: 'admind',
    max_connections: 10,
    logger: Logger.new('log/db.log')
)

# module MyAppModule
#   class App < Sinatra::Base
#     register Sinatra::Namespace

    # namespace '/api/v1' do
      get '/' do
        'Hi! Let it snow!'
      end
    # end

    #перенаправляем на другой экшн с передачей параметра
    get '/goto' do
      redirect to('hello/World')
    end

    # #именованные параметры в качестве переменных блока
    # get '/hello/:name' do |n|
    #   "Welcome, #{n}"
    # end

    get %r{/hello/[w]+} do |c|
      "Welcome, #{c}"
    end

    get '/hello/:name' do
      #маршрут - фильтр
      "Welcome, #{params[:name]}"
    end

    get '/say/*/to/*' do
      # соответствует /say/hello/to/world
      params['splat'].to_s
    end
    # get '/*' do
    #   #маршрут-маска - splat - дефолтный
    #   "It's place for your custom request - #{params[:splat]}"
    # end

    #Необязательные параметры в шаблонах маршрутов
    # http://localhost:4567/jobs.json
    get '/jobs.?:format' do
      'Да, работает этот маршрут!'
    end

#   end
# end