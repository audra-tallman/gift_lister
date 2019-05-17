require 'pry'
class RecipientsController < AppController

#Loads Index Page
  get '/recipients' do
    # redirect_if_not_logged_in
    # if @current_user
      @recipients = Recipient.all
      erb :'recipients/index'
    # else
    #   @error_message = params[:error]
    #   redirect to '/login'
   end

#Loads New Recipient Form
  get '/recipient/new' do
    # redirect_if_not_logged_in
    # @error_message = params[:error]
    erb :'recipients/new'
  end


#Loads Show Page
   get '/recipient/:id' do  #loads show page
     @recipient = Recipient.find(params[:id])
     erb :'recipients/show'
   end

#Loads Edit Form
  get '/recipient/:id/edit' do
    # redirect_if_not_logged_in
    # @error_message = params[:error]
    @recipient = Recipient.find(params[:id])
    erb :'recipients/edit'
  end

#Creates Recipient & Gift List
  post '/recipients' do
    # redirect_if_not_logged_in
    #
    # unless Recipient.valid_params?(params)
    #   redirect to '/recipients/new?error=invalid recipient'
    # end
    # Recipient.create(params)
    # redirect to '/recipients'
    @recipient = Recipient.create(params)
    # (:name => params[:name], :gifts => params[:gifts])
    redirect to '/recipients'
   end

#Updates Recipient & Gift List
   patch '/recipient/:id' do
    # redirect_if_not_logged_in
    @recipient = Recipient.find(params[:id])
    # unless Recipient.valid_params?(params)
    #   redirect "/recipient/#{@recipient.id}/edit?error=invalid recipeient"
    # end
    @recipient.name = params[:name]
    @recipient.gifts = params[:gifts]
    @recipient.save
    redirect to '/recipient/#{@recipient.id}'
  end

#Deletes Recipient & Gift List
  delete '/recipient/:id' do
    # @recipient = Recipient.find(params[:id])
    # @recipient.delete
    redirect to '/recipients'
  end

end
