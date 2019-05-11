class UsersController < AppController

  get '/signup' do
    if !session[:user_id]
      erb :'users/new'
    else
      redirect to '/that'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      redirec to '/signup'
    else
      @user = User.create(:username => params[:username], :password =>[:password])
      session[:user_id] = @user.id
      redirec '/this'
    end
  end

end
