class PublicController < ApplicationController
  include PublicHelper
  include Public::ErrorsHelper
  helper_method :article_path, :profile_path

  def article_path(article)
    public_article_path(article.year.year, article.issue.number, article.slug)
  end

  def profile_path(profile)
    author_path(profile)
  end

end
