# == Schema Information
#
# Table name: roles
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  capabilities :string(255)      default([]), is an Array
#  created_at   :datetime
#  updated_at   :datetime
#

class Role < ActiveRecord::Base
  # Associations
  has_many :users

  # Validations
  validates :name, presence: true, uniqueness: true

  # Lifecycle Callbacks
  stop = Proc.new{false}
  before_destroy :stop, if: :default?

  alias_attribute :caps, :capabilities

  def self.default
    Settings::DefaultRole.get.role
  end

  def self.capabilities
    Role.all.map {|r| r.caps}.reduce(:+).uniq
  end

  def default?
    self == Role.default
  end

  def can? action
    caps.include? action.to_sym
  end

end
