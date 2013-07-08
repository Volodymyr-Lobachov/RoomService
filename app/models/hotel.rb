class Hotel < ActiveRecord::Base
  has_many :photos
  has_many :coments
  belongs_to :user
  
  attr_accessible :address, :breakfast, :price, :room_description, :title, :hotel_id, :user_id
   letsrate_rateable "mark"
end
