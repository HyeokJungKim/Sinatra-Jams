require './config/environment'

class ApplicationController < Sinatra::Base

  

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  get "/" do
    erb :welcome
  end

  get "/artist" do   
    erb :artist
  end
  #CREATE
  get "/artist/new" do
    erb :new
  end
  
  #READ
  get "/artist/:id" do 
    @artist = Artist.find(params[:id])
    erb :show
  end

  post "/artist" do   
    Artist.create(params[:artist])
    redirect "/artist"
  end

  #UPDATE
  patch '/artist/:id' do
    @artist = Artist.find(params[:id])
    @artist.update(params[:artist])
    redirect "/artist/#{@artist.id}"
  end

  #EDIT
  get '/artist/:id/edit' do
    @artist = Artist.find(params[:id])
    erb :edit
  end

  #DELETE
  delete '/artist/:id' do
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect '/artist'
  end

end
