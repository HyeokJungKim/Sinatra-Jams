class InstrumentsController < ApplicationController
    get '/instruments' do
        @instruments = Instrument.all
        erb :index_i
    end

    get '/instruments/:id' do
        @instrument = Instrument.find(params[:id])
        erb :show_i
    end
end