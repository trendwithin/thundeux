class CommentsController < ApplicationController

  def create
    @memory = Memory.find(params[:memory_id])
    @comment = @memory.comments.build(comment_params)
    if @comment.save
      redirect_to memory_path(@memory), notice: 'Comment sent'
    else
      redirect_to @memory, alert: 'Unable to send the comment', notice: 'Comment can\'t be blank'
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :memory_id)
    end
end
