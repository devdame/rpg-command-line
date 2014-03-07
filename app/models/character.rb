class Character < ActiveRecord::Base

  belongs_to :game
  belongs_to :location, class_name: :Room

  has_many :items, as: :possessable

  has_many :actions, as: :actionable

end
