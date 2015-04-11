# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  editor_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Department < ActiveRecord::Base
  # Associations
  belongs_to :editor, class_name: "User"
  has_many :articles

  # Validations
  validates :name, presence: true, uniqueness: true

  def self.with_published_articles
    all.select {|d| d.articles.published.count > 0}
  end
end
