class Photo < ActiveRecord::Base
  attr_accessible :title, :image, :remote_image_url
  belongs_to :hotel
  mount_uploader :image, ImageUploader
end
