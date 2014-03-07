class CreatePossibleActions < ActiveRecord::Migration
  def change
    create_table :possible_actions do |t|
      t.integer :action_id
      t.integer :actionable_id
      t.string :actionable_type

      t.timestamps
    end
  end
end
