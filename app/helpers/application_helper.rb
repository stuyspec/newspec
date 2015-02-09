module ApplicationHelper
  def public_article_path(article)
    issue = article.issue
    year = issue.year
    super year: year.year, issue: issue.number, article_slug: article.slug
  end
end
