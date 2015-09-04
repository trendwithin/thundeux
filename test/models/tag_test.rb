require "test_helper"

class TagTest < ActiveSupport::TestCase

  def tag
    @tag ||= Tag.new(name: 'Vintage')
  end

  def test_valid
    assert tag.valid?
  end

end
