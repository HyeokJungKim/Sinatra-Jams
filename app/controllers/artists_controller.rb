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
        redirect to("/artists/#{@artist.id}")
      end
    
      get "/artists/:id/edit" do
        @artist = Artist.find(params[:id])
        @instruments = Instrument.all
        erb :edit
      end
    
      patch "/artists/:id" do
        @artist = Artist.find(params[:id])
        @artist.update(name: params[:name], age: params[:age], bio: params[:bio])
        redirect to("/artists/#{@artist.id}")
      end
    
      delete "/artists/:id" do
        @artist = Artist.find(params[:id])
        @artist.delete
        redirect to("/artists")
      end

      post "/artists/new_session" do
        @artist = Artist.find(params[:artist_id])
        params[:instrument_id].each do |id|
            Session.create(artist_id: params[:artist_id], instrument_id: id)
        end
        redirect to("/artists/#{@artist.id}")
      end

end