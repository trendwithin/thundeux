module MemoriesHelper
  def pending? user, memory
    current_user == memory.user && memory.pending_comments?
  end

  def related_memories_to_user user
    Memory.related_tags(user).related_users(user).first(6)
  end
end
