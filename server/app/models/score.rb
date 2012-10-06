class Score < ActiveRecord::Base
  belongs_to :bathroom
  belongs_to :ScoreType
  attr_accessible :value
end
