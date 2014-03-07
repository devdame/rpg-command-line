class Character < ActiveRecord::Base

  belongs_to :game
  belongs_to :location, class_name: :Room

  has_many :items, as: :possessable

  has_many :actions, as: :actionable

  def get_inventory
    if items.any?
      inventory = "Here's what you are carrying:\n"
      items.each {|item| inventory.concat("#{item.long_name}\n")}
      inventory
    else
      "You are not carrying anything."
    end
  end


end
