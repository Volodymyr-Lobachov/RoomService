class Coment < ActiveRecord::Base
  belongs_to :hotel
  attr_accessible :mark
  belongs_to :user
end
