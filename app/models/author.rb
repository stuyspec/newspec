class Author < ActiveRecord::Base

  has_many :articles

  validates_presence_of :first, :last, :slug
  validates_uniqueness_of :slug

  class << self
    def is_unique_slug(slug)
      not Author.exists?(slug: slug)
    end
  end

  def name
    "#{first} #{last}"
  end

end
