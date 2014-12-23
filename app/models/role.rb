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
#

class Role < ActiveRecord::Base
  has_many :users
  validates :name, presence: true, uniqueness: true
  before_destroy :check_default

  self.alt_name :capabilities, :caps

  def self.default
    Settings::DefaultRole.get.role
  end

  def can? action
    return self.caps.include? action
  end

  def default? role
    role == Role.default
  end

  private

  def check_default
    return false if self.default? # don't delete the default!
  end

end
