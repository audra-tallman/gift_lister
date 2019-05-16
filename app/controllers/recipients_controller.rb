require 'pry'
class RecipientsController < AppController

#Read
  get '/recipients' do
    redirect_if_not_logged_in
    if @current_user
      @recipients = Recipient.all
      erb :'recipients/index'
    # else
    #   @error_message = params[:error]
    #   redirect to '/login'
    end
   end

#Create
  get '/recipients/new' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'recipients/new'
   end

  post '/recipients' do
    redirect_if_not_logged_in

    unless Recipient.valid_params?(params)
      redirect to '/recipients/new?error=invalid recipient'
    end
    Recipient.create(params)
    redirect to '/recipients'
   end

#Update
   get '/recipient/:id/edit' do
     redirect_if_not_logged_in
     @error_message = params[:error]
     @recipient = Recipient.find(params[:id])
     binding.pry
     erb :'recipients/edit'
   end

   patch '/recipients/:id' do
    redirect_if_not_logged_in
    @recipient = Recipient.find(params[:id])
    unless Recipient.valid_params?(params)
      redirect "/recipient/#{@recipient.id}/edit?error=invalid recipeient"
    end
    @recipient.update(params.select{"name"})
    redirect to "/recipient/#{@recipient.id}"
  end

#Read
  get '/recipients/show/:id' do
    redirect_if_not_logged_in
    @recipient = Recipient.find(params[:id])
    erb :'recipients/show'
  end


end
