class ArticlesController < ApplicationController

  # GET /:year
  def by_year
    @issues = Article.published.by_year(params[:year]).group_by_issue
  end

  # GET /:year/:issue_num
  def by_issue
    @issue = issue
    @articles = Article.published.by_issue(@issue)
  end

  private

  def issue
    Issue.new params[:year].to_i, params[:issue_num].to_i
  end
end
