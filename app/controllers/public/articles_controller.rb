class Public::ArticlesController < PublicController
  before_action :set_article, only: [:show]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.includes(:author).all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Year.find_by(:year => params[:year_id]).issues.find_by(:number => params[:issue_id]).articles.find(params[:article_slug])
    end
end
