class Item < ActiveRecord::Base
  has_many :possible_actions, as: :actionable
  has_many :actions, through: :possible_actions
  belongs_to :possessable, polymorphic: true
	
  def use(action, item)
  #  it works if useable_by[item].include?(action)
  end
end
