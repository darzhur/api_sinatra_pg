#API
require 'sinatra'
require 'sinatra/namespace'
require 'sinatra/base'
require 'sequel'
require 'sequel/extensions/seed'
# require 'pg'
# require 'json'
# require 'multi_json'

DB = Sequel.connect(
    adapter: :postgres,
    database: 'api_sinatra_development',
    host: 'localhost',
    password: 'password',
    user: 'admind',
    max_connections: 10,
    # logger: Logger.new('log/db.log')
)

%w{controllers models routes}.each {|dir| Dir.glob("./#{dir}/*.rb", &method(:require))}

before do
  content_type 'application/json' # Uncomment - To see perfectly in POSTMAN - in tab Pretty
end

#сериализируем - приводим в удобо
def collection_to_api(collection)
  MultiJson.dump(collection.map { |s| s.to_api })
end
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