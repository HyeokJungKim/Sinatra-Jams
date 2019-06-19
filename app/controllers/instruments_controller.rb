class InstrumentsController < ApplicationController

    # get "/instruments" do
    #     @instruments = Instrument.all
    # end

    get "/instruments/:id" do
        @instrument = Instrument.find(params[:id])
        erb :instrument_show
    end

end