class CommentsController < ApplicationController
  def index; end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new comment_params

    respond_to :js if @comment.save
  end

  private
  
  def comment_params
    params.require(:comment).permit Comment::COMMENT_PARAMS
  end
end
