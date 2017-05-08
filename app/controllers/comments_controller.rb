class CommentsController < ApplicationController
  before_action :authorize
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params.merge(:user_id => session[:user_id]))
    redirect_to article_path(@article)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
