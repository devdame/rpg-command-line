class CreateCharacters < ActiveRecord::Migration
  def change
  	create_table :characters do |t|
  		t.string :name
  		t.integer :location_id
  		t.integer :game_id

  		t.timestamps
  	end
  end
end
