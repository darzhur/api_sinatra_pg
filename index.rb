#API
require 'sinatra'
require 'sinatra/namespace'
require 'sinatra/base'

module MyAppModule
  class App < Sinatra::Base
    register Sinatra::Namespace

    namespace '/api/v1' do
      get '/' do
        'Hi! Let it snow!'
      end
    end

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

    get '/*' do
      #маршрут-маска - splat - дефолтный
      "It's place for your custom request - #{params[:splat]}"
    end

  end
end
