class ArtistsController < ApplicationController
    get "/artists" do
        @artists = Artist.all
        erb :index
      end
    
      get "/artists/new" do
        erb :new
      end
    
      get "/artists/:id" do
        @artist = Artist.find(params[:id])
    
        erb :show
      end
    
      post "/artists" do
        @artist = Artist.create(params)
        redirect to ("/artists/#{@artist.id}")
      end
    
      #edit shit
      get "/artists/:id/edit" do
        @artist = Artist.find_by_id(params[:id])
        erb :edit
      end
    
      patch "/artists/:id" do
        artist = Artist.find_by_id(params[:id])
        artist.update(name: params[:name], age: params[:age], bio: params[:bio])
        redirect to("/artists/#{artist.id}")
      end
    
      delete "/artists/:id" do
        Artist.destroy(params[:id])
    
        redirect to("/artists")
      end
end