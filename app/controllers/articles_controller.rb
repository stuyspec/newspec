class ArticlesController < ApplicationController
  def index
    @articles = Article.published
  end

  def show
  end
end
