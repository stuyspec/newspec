# == Schema Information
#
# Table name: years
#
#  id         :integer          not null, primary key
#  year       :integer
#  created_at :datetime
#  updated_at :datetime
#

class Year < ActiveRecord::Base
  # Associations
  has_many :issues

  # Validations
  validates :year, presence: true, uniqueness: true

  def articles
    Article.joins("INNER JOIN issues ON articles.issue_id=issues.id").joins("INNER JOIN years ON issues.year_id=years.id").where("year_id = ?", id)
  end
end
