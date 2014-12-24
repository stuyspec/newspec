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
end
