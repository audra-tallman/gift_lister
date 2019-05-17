require 'pry'
class UsersController < AppController

  get '/account' do
    @user = User.find(session[:user_id])
      erb :'users/show'
    end


#Signup
  get '/signup' do
      erb :'users/new'
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.create(:username => params[:username], :password =>[:password])
      session[:user_id] = @user.id
      redirect to '/account'
    end
  end

#Login
  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    binding.pry
    if user && user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/account'
    else
      redirect to '/failure'
    end
  end

  get "/failure" do
    erb :error
  end

#Logout
  get '/logout' do
    session.clear
    redirect to '/'
  end

end
