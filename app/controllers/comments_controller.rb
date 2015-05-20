class CommentsController < ApplicationController

  def create
    @memory = Memory.find(params[:memory_id])
    @comment = @memory.comments.create(comment_params)
    redirect_to memory_path(@memory)
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end
