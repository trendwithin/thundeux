require "test_helper"

class MemoryTest < ActiveSupport::TestCase

  def memory
    @memory ||= Memory.new
  end

  def test_valid
    assert memory.valid?
  end

end
