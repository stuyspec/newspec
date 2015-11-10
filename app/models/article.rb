class Article < ActiveRecord::Base

  composed_of :issue, class_name: 'Issue', mapping: [ ['year', 'year'], ['issue_num', 'issue_num'] ], allow_nil: true

  belongs_to :author

  validates :title, presence: true, uniqueness: true, if: :published?
  validates_presence_of :text, if: :published?
  validates_presence_of :author_id

  class NoArticle; end

  class << self
    def published
      where("publish_date <= ?", DateTime.now)
    end

    def find_published(id)
      published.find(id)
    rescue ActiveRecord::RecordNotFound
      return NoArticle
    end

    def by_year(year)
      where(year: year)
    end

    def by_issue(issue)
      where(issue: issue)
    end

    def to_issues
      group(:issue_num, :year).select(:issue_num, :year).map &:issue
    end

    def group_by_issue
      Hash[
        to_issues.map do |issue|
          [issue, by_issue(issue)]
        end
      ]
    end
  end

  def published?
    if publish_date.present?
      publish_date <= DateTime.now
    end
  end
end
