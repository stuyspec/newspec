class Article < ActiveRecord::Base
  composed_of :issue, class_name: 'Issue',
                      mapping: [%w(year year), %w(issue_num issue_num)],
                      allow_nil: true

  belongs_to :author

  validates :title, presence: true, uniqueness: true, if: :published?
  validates_presence_of :text, if: :published?
  validates_presence_of :author_id

  class NoArticle; end

  def self.published
    where('publish_date <= ?', DateTime.now)
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

  def self.to_issues
    group(:issue_num, :year).select(:issue_num, :year).map(&:issue)
  end

  def self.group_by_issue
    mapping = to_issues.collect do |issue|
      [issue, by_issue(issue)]
    end
    Hash[mapping]
  end

  def published?
    publish_date <= DateTime.now if publish_date.present?
  end
end
