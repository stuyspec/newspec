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
  validates :name, presence: true, uniqueness: true
  validates :default, :only_one, presence: true

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

  private

  def only_one
    (not default) or (Role.count(default: true) < 1)
  end

end
