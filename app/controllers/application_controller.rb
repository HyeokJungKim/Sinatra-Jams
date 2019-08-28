require './config/environment'

class ApplicationController < Sinatra::Base

  

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
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


end
