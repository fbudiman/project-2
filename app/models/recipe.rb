class Recipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  has_many :comments
  has_many :likes

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
