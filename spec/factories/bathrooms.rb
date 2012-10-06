# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bathroom do
    isHandicapAccessible false
    isPublic false
    isFamily false
    isFamily false
    isGreen false
    isUnisex false
    isHandsFree false
    hasProductDispenser false
    hasAttendent false
    hasSignage false
    hasWifi false
    venue nil
    BathroomType nil
  end
end
