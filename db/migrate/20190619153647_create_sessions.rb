class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :artist_id
      t.integer :instrument_id
    end
  end
end
