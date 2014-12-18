# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  username      :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  profile_id    :integer
#  role_id       :integer
#  department_id :integer
#

class User < ActiveRecord::Base
  belongs_to :profile
  belongs_to :role
  belongs_to :department
  validates :username, presence: true, uniqueness: true
  after_initialize :setup, if: :new_record?

  self.alt_name :username, :name # now we can say user.name
  self.make_has :role, :profile # creates has_role? and has_profile?

  # forward can? from role
  def can?(*args)
    self.role.can?(*args)
  end

  private

  def setup
    auto_profile unless has_profile?
    auto_role unless has_role?
  end

  # make sure he gets a profile
  def auto_profile
    self.profile = Profile.new user: self
  end

  # make sure he gets a role
  def auto_role
    self.role = Role.default
  end

end
