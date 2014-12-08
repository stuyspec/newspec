# == Schema Information
#
# Table name: roles
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  capabilities :string(255)      default([]), is an Array
#  default      :boolean          default(FALSE)
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#

class Role < ActiveRecord::Base
  has_many :users
  validates :name, presence: true, uniqueness: true
  validates :default, default: true

  def self.default
    Role.find_by(default: true)
  end

  def caps()
    capabilities
  end

  def caps=(capabilities)
    self.capabilities = capabilities
  end

  def can? action
    return caps.include? action
  end

end
