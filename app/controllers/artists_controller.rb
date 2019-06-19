require './config/environment'

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
    artist = Artist.create(params)
    redirect "/artists/#{artist.id}"
    end

    get "/artists/:id/edit" do
    @artist = Artist.find(params[:id])
    erb :edit
    end

    patch "/artists/:id" do
    artist = Artist.find(params[:id])
    name = params[:name]
    age = params[:age]
    bio = params[:bio]
    artist.update(name: name, age: age, bio: bio)
    redirect "/artists/#{artist.id}"
    end

    delete "/artists/:id" do
    artist = Artist.find(params[:id])
    artist.delete
    redirect "/artists"
    end
end