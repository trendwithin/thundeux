class Memory < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  validates :name, presence: true
  validates :description, presence: true

    def pending_comments?
      self.comments.pending_comment.count > 0
    end

    # Tag Related Methods

    def self.tagged_with(name)
      Tag.find_by_name!(name).memories
    end

    def tag_list
      tags.map(&:name).join(", ")
    end

    def tag_list=(names)
      self.tags = names.split(",").map do |n|
        Tag.where(name: n.strip).first_or_create!
      end
    end
end
