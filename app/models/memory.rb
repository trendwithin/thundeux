class Memory < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :name, presence: true
  validates :description, presence: true
end
