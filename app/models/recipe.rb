class Recipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  has_many :comments, :dependent => :destroy
  has_many :likes

end
