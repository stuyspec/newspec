class Article < ActiveRecord::Base
  composed_of :issue, class_name: 'Issue',
                      mapping: [%w(year year), %w(issue_num issue_num)],
                      allow_nil: true

  belongs_to :author
  belongs_to :department

  validates :title, presence: true, uniqueness: true, if: :published?
  validates :text, presence: { if: :published? }
  validates :author_id, presence: true
  validates :slug, presence: true,
                   uniqueness: { scope: %i(issue_num year) }

  class NoArticle; end

  def self.create_article(title, issue, author)
    create!(title: title, issue: issue, author: author) do |article|
      article.slug = slug_for(article)
    end
  end

  def self.ideal_slug_for(article)
    article.title.parameterize
  end

  def self.slug_for(article)
    unique = Unique.new do |slug|
      !exists?(slug: slug, issue: article.issue)
    end
    unique.call(ideal_slug_for(article))
  end

  def self.published
    where('publish_date <= ?', DateTime.now.current)
  end

  def self.find_published(id)
    published.find(id)
  rescue ActiveRecord::RecordNotFound
    NoArticle
  end

  def self.by_year(year)
    where(year: year)
  end

  def self.by_issue(issue)
    where(issue: issue)
  end

  def self.by_slug(slug, issue)
    find_by!(slug: slug, issue: issue)
  rescue
    Article::NoArticle
  end

  def self.to_issues
    group(:issue_num, :year).select(:issue_num, :year).map(&:issue)
  end

  def self.group_by_issue
    mapping = to_issues.map do |issue|
      [issue, by_issue(issue)]
    end
    Hash[mapping]
  end

  def published?
    publish_date <= DateTime.now.current if publish_date.present?
  end
end
