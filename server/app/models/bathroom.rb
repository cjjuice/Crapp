class Bathroom < ActiveRecord::Base
  belongs_to :venue
  belongs_to :BathroomType
  attr_accessible :hasAttendent, :hasProductDispenser, :hasSignage, :hasWifi, :isFamily, :isFamily, :isGreen, :isHandicapAccessible, :isHandsFree, :isPublic, :isUnisex
end
