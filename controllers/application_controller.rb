class ApplicationController < Sinatra::Base

  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __FILE__)

  get '/' do
    'Hello, World!'
    erb :index
  end

# Issuer Controller

  get '/issuer/signup' do
    erb :'/issuer/signup'
  end

  post '/issuer/signup' do
    @issuer = Issuer.create(username: params[:username], password: params[:password])
    redirect "/issuer/#{ @issuer.id }"
  end

  get '/issuer/:id' do
    @issuer = Issuer.find(params[:id])
    erb :'issuer/dashboard'
  end


# Receipt Controller



end
