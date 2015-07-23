require "test_helper"

class CommentTest < ActiveSupport::TestCase

  def comment
    @comment ||= Comment.new
  end

  def test_valid
    refute comment.valid?
  end

end
