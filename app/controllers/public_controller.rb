class PublicController < ApplicationController
  helper_method :article_path, :profile_path

  def aloha
  end

  def tinymce
  end

  def article_path(article)
    public_article_path(article)
  end

  def profile_path(profile)
    author_path(profile)
  end

end
