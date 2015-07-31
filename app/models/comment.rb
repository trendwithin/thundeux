class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :memory

  validates :body, presence: true

  scope :pending_comment, -> { where approved: false }
  scope :approved_comment, -> { where approved: true }
end
