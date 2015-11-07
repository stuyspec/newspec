class Author < ActiveRecord::Base
  UniqueSlugMaker = Unique.new { |slug| not Author.exists?(slug: slug) }

  has_many :articles

  validates_presence_of :first, :last, :slug
  validates_uniqueness_of :slug

  class << self
    def create_author(first, last)
      create!(first: first, last: last) do |author|
        author.slug = UniqueSlugMaker.call(author.name.parameterize)
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
