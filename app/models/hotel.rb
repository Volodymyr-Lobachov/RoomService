class Hotel < ActiveRecord::Base
  has_many :photos
  has_many :coments
  belongs_to :user
  
  attr_accessible :address, :breakfast, :price, :room_description, :title, :hotel_id, :user_id, 
  				  :country, :state, :city, :street, :get_addres
  attr_accessor :country, :state, :city, :street

before_save :coupling
after_find :get_address



	def self.get_top_five_hotels
		top_ratings = RatingCache.find(:all, :order => "avg DESC", :limit => 5)
		Hotel.find(top_ratings.map{|hotel| hotel.cacheable_id})
	end
	
protected
	def get_address
		self.country, self.state, self.city, self.street = self.address.split '/'
		return self
	end

	def coupling
		self.address = [country, state, city, street].join('/')
	end
   letsrate_rateable "mark"
end
