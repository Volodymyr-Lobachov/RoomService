FactoryGirl.define do
  factory :user do
    
    name 'name'
    email '163@gmail.com'
    password '12345678'
    visited_hotels '1 2 3'
 
 
  end
    factory :hotel do
    
    title 'dsa'
    breakfast '1'
    price '678'
    room_description 'asds'
    country 'sd'
    state 'd'
    city 'sd'
    street 'sdc'

 
  end
  factory :coment do
    mark 'Nice hotel'
    hotel_id '1'
    
  end
  factory :photo do
    title 'Photo'
    image "Grand.bmp"
    hotel_id '1'    
  end
end 
