require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  get '/' do
    puts "HI"
    erb :welcome
  end

  get '/artists' do
    search_term = params[:search_term]
    searched_artists = Artist.where("name like ?", "%#{search_term}%")
    if searched_artists.length > 0
      @artist = searched_artists
    else
      @artist = artists.all
    end
    erb :index
  end

  put '/artists/:id' do
    @artist = Artist.find_by(id: params[:id])

    # binding.pry
    @artist.update(params[:artist])
    redirect to "/artists/#{@artist.id}"
  end

  get '/artists/new' do
    erb :new
  end

  post '/artists' do
    # redirect to /artists/:id
    # binding.pry
    @artist = Artist.create(params)
    redirect to "/artists/#{@artist.id}"
  end

  get '/artists/:id' do
    @artist = Artist.find_by(id: params[:id])
    erb :show
  end

  get '/artists/:id/edit' do
    @artist = Artist.find_by(id: params[:id])
    erb :edit
  end

  delete '/artists/:id' do
    @artist = Artist.find_by(id: params[:id])
    @artist.delete
    redirect to "/artists"
  end


end
