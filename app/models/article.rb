class Article < ActiveRecord::Base

  composed_of :issue, class_name: 'Issue', mapping: [ ['year', 'year'], ['issue_num', 'issue_num'] ], allow_nil: true

  belongs_to :author

  validates :title, presence: true, uniqueness: true, if: :published?
  validates_presence_of :text, if: :published?
  validates_presence_of :author_id

  class NoArticle; end

  def self.published
    where("publish_date <= ?", DateTime.now)
  end

  def self.find_published(id)
    published.find(id)
  rescue ActiveRecord::RecordNotFound
    return Article::NoArticle
  end

  def published?
    if publish_date.present?
      publish_date <= DateTime.now
    end
  end
end
