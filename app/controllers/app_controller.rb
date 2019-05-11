require './config/env'

class AppController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "giftsforall"
  end

  get '/' do
    "Welcome to Gift Lister!"
  end

end
