# == Schema Information # # Table name: users
#
#  id            :integer          not null, primary key
#  username      :string(255)
#  created_at    :datetime #  updated_at    :datetime
#  profile_id    :integer #  role_id       :integer
#  department_id :integer
#

class User < ActiveRecord::Base
  # Associations
  belongs_to :profile
  belongs_to :role
  belongs_to :department
  has_many :articles, through: :profile

  # Validations
  validates :username, presence: true, uniqueness: true

  # Lifecycle Callbacks
  after_initialize :setup, if: :new_record?

  alias_attribute :name, :username

  def can? *args
    role.can? *args
  end

  # private

  def setup
    auto_profile unless profile.present?
    auto_role unless role.present?
  end

  def auto_profile
    self.profile = Profile.new user: self
  end

  def auto_role
    self.role = Role.default
  end

end
