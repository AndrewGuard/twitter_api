class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :posts, through: :taggings
  # Remember to create a migration!
end
