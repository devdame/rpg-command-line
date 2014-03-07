class PossibleAction < ActiveRecord::Base
  belongs_to :actionable, polymorphic: true
  belongs_to :action
end
