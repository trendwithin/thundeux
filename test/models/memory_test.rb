require "test_helper"

class MemoryTest < ActiveSupport::TestCase

  def memory
    @memory ||= Memory.new(name: "Only a Memory", description: "The Smithereens")
  end

  def test_valid
    assert memory.valid?
  end

  def test_validity_without_title_body
    memory.name = ''
    memory.description = ''
    assert_not memory.valid?
  end
end
