module MemoriesHelper
  def pending? user, memory
    current_user == memory.user && memory.pending_comments?
  end
end
