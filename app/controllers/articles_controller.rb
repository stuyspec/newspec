class ArticlesController < ApplicationController

  # GET /:year
  def by_year
    @issues = Article.published.by_year(params[:year]).group_by_issue
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find_published(params[:id])
    raise ActionController::RoutingError.new("Article not found") if @article == Article::NoArticle
  end
end
