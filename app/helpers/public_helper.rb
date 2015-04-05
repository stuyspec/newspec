module PublicHelper
  NAME = "Stuyvesant Spectator"

  def authors_text(article)
    links = article.authors.collect {|author| link_to author, author}
    if links.length == 1
        links[0]
    else
      out = links[0...-1].join(", ") + " and " + links[-1]
      out.html_safe
    end
  end

  private

  def get_year(year)
    Year.find_by(year: params[:year])
  end

  def get_issue(issue, year)
    year = get_year year
    year.issues.find_by(:number => params[:issue]) unless year.nil?
  end

  def get_article(slug, issue, year)
    issue = get_issue issue, year
    published = issue.articles.published unless issue.nil?
    published.friendly.find(params[:article_slug]) unless published.count == 0
  end

end
