class RecipientsController < AppController

  get "/recipients" do
   redirect_if_not_logged_in
   @recipients = Recipient.all
   erb :'recipients/index'
 end

end
