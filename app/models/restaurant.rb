class Restaurant < ActiveRecord::Base
  has_many :recipes

  validates_presence_of :name
  validates_presence_of :location
end
