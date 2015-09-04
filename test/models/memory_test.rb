require "test_helper"

class MemoryTest < ActiveSupport::TestCase

  def memory
    @memory ||= Memory.new(name: "Only a Memory", description: "The Smithereens")
    @shanes_memory = memories(:three)
  end

  def test_valid
    assert memory.valid?
  end

  def test_validity_without_title_body
    memory.name = ''
    memory.description = ''
    assert_not memory.valid?
  end

  def test_shanes_memory_is_related_to_vics
    user = users(:shane)
    related = Memory.related_tags(user).related_users(user)
    assert true, related.include?(memories(:two).name)
  end
end
