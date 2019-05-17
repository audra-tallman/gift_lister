require './config/env'

class AppController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "giftsforall"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
    # "Welcome to Gift Lister!"
  end

  helpers do
     def redirect_if_not_logged_in
       if !logged_in?
         redirect "/login"
       end
     end

     def current_user
       @current_user ||= User.find_by(:id => session[:user_id]) if session[:user_id]
     end

     def logged_in?
       !!session[:user_id]
     end

   end
 end
