class Author < ActiveRecord::Base

  def self.slug(author)
    author.name.parameterize
  end

  def name
    "#{first} #{last}"
  end

end
