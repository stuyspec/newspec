module PublicHelper

  private

  def get_year
    Year.find_by(year: params[:year])
  end

  def get_issue(year = get_year)
    year && year.issues.find_by(:number => params[:issue])
  end

  def get_article(issue = get_issue(get_year))
    issue && issue.articles.published.friendly.find(params[:article_slug])
  end

end
