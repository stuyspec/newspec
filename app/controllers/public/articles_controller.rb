class Public::ArticlesController < PublicController
  before_action :set_article, only: [:show]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.includes(:author).includes(:issue)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @year = Year.find_by(:year => params[:year])
      @issue = @year.issues.find_by(:number => params[:issue])
      @article = @issue.articles.friendly.find(params[:article_slug])
    end
end
