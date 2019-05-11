class RecipientsController < AppController

  get "/recipients" do
   if logged_in?
     @recipients = Recipient.all
     erb :'recipients/index'
   else
     redirect to '/login'
   end
 end

end
