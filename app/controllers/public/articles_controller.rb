class Public::ArticlesController < PublicController
  before_action :set_article, only: [:show]

  def index
    @articles = Article.includes(:authors).includes(:issue).includes(:year).published
  end

  def show
    render_404 if @article.nil?
  end

  private

  def set_article
    @article = get_article params[:article_slug], params[:issue], params[:year]
  end

end
