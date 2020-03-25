class CommentsController < ApplicationController
	before_action :set_comment

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.save
  end

	private

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment)
          .merge(article_id: params[:article_id])
  end
end