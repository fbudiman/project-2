class User < ActiveRecord::Base
  has_many :recipes
  has_many :likes
  has_many :comments

  has_secure_password

  validates :email, presence: true, uniqueness: {case_sensitive: false}

end
