class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe

  validates_presence_of :comment
end
