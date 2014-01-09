class Photo < ActiveRecord::Base
  #validates_format_of :image, with: /$[jpg|bmp|png]/, message: "Invalid format must be (jpg, bmp, png)"

  attr_accessible :title, :image, :remote_image_url, :hotel_id
  belongs_to :hotel
  mount_uploader :image, ImageUploader
end
