class VotesController < ApplicationController
  before_action :authorize
  def create
    if Vote.where(:article_id => params[:article_id], :user_id => session[:user_id]).blank?
      @article = Article.find(params[:article_id])
      @vote = @article.votes.create(:user_id => session[:user_id], :value => params[:vote_value])
      redirect_to article_path(@article)
    end
  end
end
