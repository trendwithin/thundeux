class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :memories, through: :taggings

  validates :name, presence: true
end
