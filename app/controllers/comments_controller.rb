class CommentsController < ApplicationController
	def create
		article = Article.find(params[:article_id])
	    comment = current_user.comments.new(comment_params)
	    comment.article_id = article.id
	    comment.save
	end

	private
	def comment_params
		params.require(:comment).permit(:comment)
	end
end