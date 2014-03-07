class Action < ActiveRecord::Base

  has_many :possible_actions
  has_many :items, through: :possible_actions
  has_many :rooms, through: :possible_actions
  has_many :characters, through: :possible_actions
  
end
