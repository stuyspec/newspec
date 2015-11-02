class Author < ActiveRecord::Base

  has_many :articles

  validates_presence_of :first, :last, :slug
  validates_uniqueness_of :slug

  class << self
    def is_unique_slug(slug)
      not Author.exists?(slug: slug)
    end

    def create_author(first, last)
      create!(first: first, last: last) do |author|
        author.slug = UniqueAuthorSlug.call(author)
      end
    end
  end

  def name
    "#{first} #{last}"
  end

  def to_param
    slug
  end

end
