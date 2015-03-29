module ApplicationHelper
  def public_article_path(article)
    issue = article.issue
    year = issue.year
    super year: year.year, issue: issue.number, article_slug: article.slug
  end

  def language_attributes
    {lang: I18n.locale}
  end

  def page_title(page=nil)
    title = "Stuyvesant Spectator"
    slogan = "The Pulse of the Student Body"
    sep = "|"
    if page.nil?
      "#{title} #{sep} #{slogan}"
    else
      "#{page} #{sep} #{title}"
    end
  end

  def body_attrs
    { class: body_class }
  end

  private

  def is_home
    current_page?(root_url)
  end

  def is_dept
    params[:controller] == "public/departments" and params[:action] == "show"
  end

  def is_search
    false
  end

  def is_empty_search
    false
  end

  def is_paged
    false
  end

  def is_article
    params[:controller] == "public/articles" and params[:action] == "show"
  end

  def is_author
    params[:controller] == "public/authors" and params[:action] == "show"
  end

  def body_class
    classes = [:desktop]

    if is_home
      classes << :home
      classes << :blog
    end

    classes << :archive if is_dept

    if is_search
      classes << :search
      classes << is_empty_search ? :'search-no-results' : :'search-results'
    end

    classes << :paged if is_paged

    if is_article
      classes << :single
      classes << :'single-post'
      classes << "postid-#{@article.id}"
    end

    if is_dept
      classes << :archive
      classes << :category
      classes << "category-#{@department.name.downcase}"
      classes << "category-#{@department.id}"
    end

    if is_author
      classes << :archive
      classes << :author
      classes << "author-#{@author.first.downcase}#{@author.last.downcase}"
      classes << "author-#{@author.id}"
    end

    if user_signed_in?
      classes << :'logged-in'
    end

    return classes

  end

end
