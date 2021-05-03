class ApplicationController < Sinatra::Base

  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __FILE__)
  set :method_override, true

  get '/' do
    'Hello, World!'
    erb :index
  end

# Issuer Controller

  get '/issuers/signup' do
    erb :'/issuers/signup'
  end

  post '/issuers/signup' do
    @issuer = Issuer.create(username: params[:username], password: params[:password])
    redirect "/issuers/#{ @issuer.id }/receipt/new"
  end


# Receipt Controller

# CREATE
get '/issuers/:issuer_id/receipt/new' do
 @issuer = Issuer.find(params[:issuer_id])
  erb :'receipts/new_receipt'
end

post '/receipts/:issuer_id' do
  @receipt = Receipt.create(
    item: params[:item],
    quantity: params[:quantity],
    item_price: params[:item_price],
    total_price: params[:total_price],
    issuer_id: params[:issuer_id]
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
end
