class LogCommentsController < ApplicationController
  before_action :ensure_user, only: [:destroy]

  def create
    log = Log.find(params[:log_id])
    comment = current_user.log_comments.new(log_comment_params)
    comment.log_id = log.id
    comment.save
    redirect_to log_path(log)
  end

  def destroy
    LogComment.find_by(id: params[:id], log_id: params[:log_id]).destroy
    redirect_to log_path(params[:log_id])
  end

  private

  def ensure_user
    log_comments = current_user.log_comments
    log_comments = log_comments.find_by(params[:id], log_id: params[:log_id])
    redirect_to logs_path unless log_comments
  end

  def log_comment_params
    params.require(:log_comment).permit(:comment)
  end
end
