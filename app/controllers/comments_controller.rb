class CommentsController < ApplicationController
  after_action :verify_authorized, unless: :devise_controller?

  def create
    @memory = Memory.find(params[:memory_id])
    @comment = @memory.comments.build(comment_params)
    @comment.approved = true if current_user == @memory.user
    authorize @comment
    if @comment.save
      redirect_to memory_path(@memory), notice: 'Comment Sent, Awaiting Approval.'
    else
      redirect_to @memory, alert: 'Unable to send the comment', notice: 'Comment can\'t be blank'
    end
  end

  def update
    @memory = Memory.find(params[:memory_id])
    @comment = Comment.find(params[:id])
    authorize @comment
    if @comment.update(comment_params)
      redirect_to memory_path(@memory), notice: 'Comment Approved.'
    else
      redirect_to @memory, alert: 'Unable to approve comment', notice: 'Unable to approve comment'
    end
  end

  def destroy
    @memory = Memory.find(params[:memory_id])
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @memory, notice: 'Comment Declined.' }
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :memory_id, :approved)
    end
end
