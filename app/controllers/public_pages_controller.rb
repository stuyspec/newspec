class PublicPagesController < ApplicationController
  def index
    @articles = Article.all
  end

  def tinymce
  end
end
