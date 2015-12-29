class Recipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  has_many :comments
  has_many :likes
end
