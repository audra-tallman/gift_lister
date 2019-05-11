class GiftsController < AppController

#Read
  get '/gifts' do
    redirect_if_not_logged_in
    @clubs = GolfClub.all
    erb :'gifts/index'
  end

#Create
  get '/gifts/new' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'gifts/new'
  end

  post '/gifts' do
    redirect_if_not_logged_in
    unless Gift.valid_params?(params)
      redirect "/gift/new?error=invalid gift"
    end
    Gift.create(params)
    redirect '/gifts/'
  end

#Edit
  get '/gifts/:id/edit' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @gift = Gift.find(params[:id])
    erb :'gifts/edit'
  end

  post '/gifts/:id' do
    redirect_if_not_logged_in
    @gift = Gift.find(params[:id])
    unless Gift.valid_params?(params)
      redirect '/gifts/#{@gift.id}/edit?error=invalid gift'
    end
    @gift.update(params.select{"name"})
    redirect "/gifts/#{@gift.id}"
  end

#Read
  get '/gifts/:id' do
    redirect_if_not_logged_in
    @gift = Gift.find(params[:id])
    erb :'gifts/show'
  end


end
