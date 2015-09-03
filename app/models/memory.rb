class Memory < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :name, presence: true
  validates :description, presence: true

    def pending_comments?
      self.comments.pending_comment.count > 0
    end
end
