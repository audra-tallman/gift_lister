require 'pry'
class UsersController < AppController

  get '/account' do
     @user = User.find(params[:id])
     if !@user.nil? && @user == current_user
         erb :'users/show'
     else
         redirect '/login'
     end
   end

#Signup
  get '/signup' do
    if !session[:user_id]
      erb :'users/new'
    else
      redirect to '/account'
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

#Login
  get '/login' do
    "LOG IN PAGE"
    if session[:user_id]
      erb :'users/login'
    else
      redirect to '/signup'
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user != nil && @user.password == params[:password]
      session[:user_id] = user.id
      redirect to '/recipients'
    else
      erb :error
    end
  end

#Logout
  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to '/login'
    else
     redirect to '/'
   end
  end

end
