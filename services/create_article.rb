class CreateArticle

  def initialize(article_source = Article.public_method(:new), default = Default)
    @article_source = article_source
    @default = default
  end

  def call(*args)
    @article_source.call(*args).tap do |article|
      %i(issue year status publish_date).each do |field|
        unless article.respond_to? field and article.send(field).present?
          article.send "#{field}=", @default.send(field)
        end
      end

      if article.department.blank?
        depts = article.select(:authors).authors.map(&:department).select(&:present?)
        if depts.count > 0
          article.department = depts[0]
        end
      end
    end
  end

end
