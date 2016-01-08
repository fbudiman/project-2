class Recipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy

  validates_presence_of :title
  validates_presence_of :restaurant_id
  validates_presence_of :body
end
