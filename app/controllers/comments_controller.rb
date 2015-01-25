class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @task    = Task.find params[:task_id]
    @comment = @task.comments.build comment_params
    @comment.user = current_user

    message = if @comment.save
      "Successfully create comment."
    else
      "Failed to create comment."
    end

    redirect_to task_path(@task), notice: message
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
