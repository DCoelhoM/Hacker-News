class ArticlesController < ApplicationController
  before_action :authorize, only: [:new, :create]
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
      @article = Article.new(article_params.merge(:userid => session[:user_id]))
      @article.save
      redirect_to @article
  end

  private
    def article_params
      params.require(:article).permit(:title, :source, :text)
    end
end
