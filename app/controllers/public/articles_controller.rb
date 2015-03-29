class Public::ArticlesController < PublicController
  before_action :set_article, only: [:show]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.includes(:author).includes(:issue).where(:status => :published)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    render_404 if @article.nil?
  end

  private

  def set_article
    @article = get_article params[:article_slug], params[:issue], params[:year]
  end

end
