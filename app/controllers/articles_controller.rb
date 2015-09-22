class ArticlesController < ApplicationController
  def index
    @articles = Article.published
  end
end
