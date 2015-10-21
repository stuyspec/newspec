class Article < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true, if: :published?
  validates_presence_of :text, if: :published?

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
