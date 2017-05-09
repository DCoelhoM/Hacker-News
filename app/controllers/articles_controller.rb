class ArticlesController < ApplicationController
  before_action :authorize, only: [:new, :create, :destroy]
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params.merge(:user_id => session[:user_id]))
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.user_id == session[:user_id]
      @article.destroy
      redirect_to articles_path
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :source, :text)
    end
end
