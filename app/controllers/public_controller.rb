class PublicController < ApplicationController
  helper_method :article_path, :profile_path

  def aloha
  end

  def tinymce
  end

  def article_path(article)
    issue = article.issue
    year = issue.year
    public_article_path(year: year.year, issue: issue.number, article_slug: article.slug)
  end

  def profile_path(profile)
    author_path(profile)
  end

end
