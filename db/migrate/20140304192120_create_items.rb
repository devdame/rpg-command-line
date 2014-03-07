class CreateItems < ActiveRecord::Migration
  def change
  	create_table :items do |t|
  		t.text :name
  		t.text :description
      t.integer :possessable_id
      t.string :possessable_type

  		t.timestamps
  	end
  end
end
