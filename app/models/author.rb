class Author < ActiveRecord::Base
  has_many :articles

  validates_presence_of :first, :last, :slug
  validates_uniqueness_of :slug

  def self.create_author(first, last)
    create!(first: first, last: last) do |author|
      author.slug = slug_for(author)
    end
  end

  def self.ideal_slug_for(author)
    author.name.parameterize
  end

  def self.slug_for(author)
    Unique.new do |slug|
      !Author.exists?(slug: slug)
    end.call(ideal_slug_for(author))
  end

  def name
    "#{first} #{last}"
  end

  def to_param
    slug
  end
end
