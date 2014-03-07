class Room < ActiveRecord::Base

	has_many :items, as: :possessable

	has_many :characters

	belongs_to :north_room, class_name: :Room
	belongs_to :south_room, class_name: :Room
	belongs_to :east_room, class_name: :Room
	belongs_to :west_room, class_name: :Room
	belongs_to :up_room, class_name: :Room
	belongs_to :down_room, class_name: :Room

	has_many :possible_actions, as: :actionable
  has_many :actions, through: :possible_actions

  def populate_actions
  	PossibleAction.create(actionable_id: id, actionable_type: :room, action_id: 1) if north_room
  	PossibleAction.create(actionable_id: id, actionable_type: :room, action_id: 3) if east_room
  	PossibleAction.create(actionable_id: id, actionable_type: :room, action_id: 2) if south_room
  	PossibleAction.create(actionable_id: id, actionable_type: :room, action_id: 4) if west_room
  	PossibleAction.create(actionable_id: id, actionable_type: :room, action_id: 5) if up_room
  	PossibleAction.create(actionable_id: id, actionable_type: :room, action_id: 6) if down_room
  end

end
