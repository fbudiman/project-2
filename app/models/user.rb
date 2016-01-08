class User < ActiveRecord::Base
  has_many :recipes, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  has_secure_password

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates_presence_of :name
  validates_presence_of :password
end
