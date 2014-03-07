class CreateRooms < ActiveRecord::Migration
  def change
  	create_table :rooms do |t|
  		t.text :description
  		t.string :name
  		t.integer :north_room_id
		  t.integer :south_room_id
			t.integer :east_room_id
			t.integer :west_room_id
			t.integer :up_room_id
			t.integer :down_room_id
  		
  		t.timestamps
  	end
  end
end
