class Author < ActiveRecord::Base
  
  has_many :articles

  validates_presence_of :first, :last

  def self.slug(author)
    author.name.parameterize
  end

  def name
    "#{first} #{last}"
  end

end
