class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :memory

  validates :body, presence: true
end
