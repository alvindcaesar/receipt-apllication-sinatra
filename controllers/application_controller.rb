class ApplicationController < Sinatra::Base

  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __FILE__)
  set :method_override, true

  get '/' do
    'Hello, World!'
    erb :index
  end

# Issuer Controller#####################

  get '/issuers/signup' do
    erb :'/issuers/signup'
  end

  post '/issuers/signup' do
    @issuer = Issuer.create(username: params[:username], password: params[:password])
    redirect "/issuers/#{ @issuer.id }"
  end

  get '/issuers/:id' do
    @issuer = Issuer.find(params[:id])
    erb :'issuers/dashboard'
  end
#########################################

# Receipt Controller####################3

# CREATE
get '/receipts/new' do
  erb :'receipts/new_receipt'
end

post '/receipts' do
  @receipt = Receipt.create(
    item: params[:item],
    quantity: params[:quantity],
    item_price: params[:item_price],
    total_price: params[:total_price]
  )
  redirect "/receipts/#{@receipt.id}"
end

# READ
get '/receipts/:id' do
  @receipt = Receipt.find(params[:id])
  erb :'receipts/showpage'
end

get '/receipts' do
  @receipt = Receipt.all
  erb :'receipts/index'
end

# UPDATE
get '/receipts/:id/edit' do
  @receipt = Receipt.find(params[:id])
  erb :'/receipts/edit_receipt'
end

post '/receipts/:id' do
  @receipt = Receipt.find(params[:id])
  @receipt.update(
    item: params[:item],
    quantity: params[:quantity],
    item_price: params[:item_price],
    total_price: params[:total_price]
  )
  redirect "/receipts/#{@receipt.id}"
end

# DELETE
delete '/receipts/:id/delete' do
  @receipt = Receipt.find(params[:id])
  @receipt.destroy
  redirect "/receipts/new"
end

# get '/receipts/:id/delete' do
#   receipt = Receipt.find(params[:id])
#   if receipt
#     receipt.destroy
#   else
#     "Something wrong"
#   redirect "/receipts/new"
#   end
# end

end
