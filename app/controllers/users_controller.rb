class UsersController < AppController

  get '/signup' do
    if !session[:user_id]
      erb :'users/new'
    else
      redirect to '/index'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.create(:username => params[:username], :password =>[:password])
      session[:user_id] = @user.id
      redirect to '/recipients'
    end
  end

  get '/login' do
    @error_message = params[:error]
    if !session[:user_id]
      erb :'users/login'
    else
      redirect to '/index'
  end

  post '/login' do
   user = User.find_by(:username => params[:username])
   if user && user.authenticate(params[:password])
     session[:user_id] = user.id
     redirect to '/recipients'
   else
     redirect to '/signup'
   end
  end

  get '/logout' do
   if session[:user_id] != nil
     session.destroy
     redirect to '/login'
   else
     redirect to '/'
   end
  end

end
