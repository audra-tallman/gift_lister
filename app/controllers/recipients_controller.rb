class RecipientsController < AppController

#Read
  get '/recipients' do
   redirect_if_not_logged_in
     @recipients = Recipient.all
     erb :'recipients/index'
   end

#Create
   get '/recipients/new' do
     redirect_if_not_logged_in
     @error_message = params[:error]
     erb :'recipeints/new'
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
   get '/recipients/:id/edit' do
     redirect_if_not_logged_in
     @error_message = params[:error]
     @recipeients = Recipient.find(params[:id])
     erb :'recipeients/edit'
   end

   post '/recipients:id' do
    redirect_if_not_logged_in
    @recipeients = Recipient.find(params[:id])
    unless Recipient.valid_params?(params)
      redirect "/recipients/#{@recipient.id}/edit?error=invalid recipeient"
    end
    @recipient.update(params.select{"name"})
    redirect to "/recipients/#{@recipient.id}"
  end

#Read
  get '/recipents/:id' do
    redirect_if_not_logged_in
    @recipient = Recipient.find(params[:id])
    erb :'recipeints/show'



end
