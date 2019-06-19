class Artist < ActiveRecord::Base

    has_many :instruments, through: :sessions
    has_many :sessions

end