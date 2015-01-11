class PublicController < ApplicationController
  def index
    @articles = Article.all
  end

  def aloha
  end

  def tinymce
  end
end
