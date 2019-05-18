require 'pry'
class RecipientsController < AppController

#Loads Index Page
  get '/recipient' do
    if logged_in?
      current_user
      erb :'recipient/index'
    else
      redirect to '/login'
    end
  end

#Loads New Recipient Form Page
  get '/recipient/new' do
    if redirect_if_not_allowed(recipient)
      redirect to '/recipient'
    end
    if logged_in?
      erb :'recipient/new'
    else
      redirect to '/login'
    end
  end

#Loads Edit Form
  get '/recipient/:id/edit' do
    if logged_in?
      @recipient = Recipient.find(params[:id])
      erb :'recipient/edit'
    else
      redirect to '/login'
    end
  end

#Creates Recipient & Gift List
  post '/recipient' do
    if logged_in?
      @recipient = Recipient.create(params)
      @recipient.user_id = session[:user_id]
      @recipient.save
      redirect to '/recipient'
    else
      redirect to '/login'
    end
  end

#Updates Recipient & Gift List
   patch '/recipient/:id' do
    if logged_in?
      @recipient = Recipient.find(params[:id])
      @recipient.name = params[:name]
      @recipient.gifts = params[:gifts]
      @recipient.save
      redirect to '/recipient'
    else
      redirect to '/login'
    end
  end

#Deletes Recipient & Gift List
  delete '/recipient/:id' do
    if logged_in?
      @recipient = Recipient.find(params[:id])
      @recipient.delete
      redirect to '/recipient'
    else
      redirect to '/login'
    end
  end

end
