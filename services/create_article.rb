class CreateArticle

  def initialize(article_source = Article.public_method(:new), default = Default)
    @article_source = article_source
    @default = default
  end

  def call(*args)
    @article_source.call(*args).tap do |a|
      %i(issue year status).each do |field|
        a.send "#{field}=", @default.send(field)
      end
    end
  end

end
