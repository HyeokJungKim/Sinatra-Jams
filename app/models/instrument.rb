class Instrument < ActiveRecord::Base

    has_many :artists, through: :sessions
    has_many :sessions
    
end