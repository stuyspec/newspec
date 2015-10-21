class ArticlesController < ApplicationController
  
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.published
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find_published(params[:id])
    raise ActionController::RoutingError.new("Article not found") if @article == Article::NoArticle
  end
end
