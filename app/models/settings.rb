# == Schema Information
#
# Table name: settings
#
#  id         :integer          not null, primary key
#  type       :string(255)      not null
#  value      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Settings < ActiveRecord::Base
  # Validations
  validates :type, presence: true, uniqueness: true
  validates :value, presence: true
end
