class Public::PublicController < ApplicationController
  def index
    @articles = Article.all
  end

  def aloha
  end
end
