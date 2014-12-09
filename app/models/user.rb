# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  profile_id :integer
#  role_id    :integer
#

class User < ActiveRecord::Base
  belongs_to :profile
  belongs_to :role
  validates :username, presence: true, uniqueness: true
  after_create :add_def_profile, unless: :has_profile?
  after_create :add_def_role, unless: :has_role?

  self.alt_name :username, :name # now we can say user.name
  self.make_has :role, :profile # creates has_role? and has_profile?

  # make sure he gets a profile
  def add_def_profile
    self.profile = self.create_profile
  end

  # make sure he gets a role
  def add_def_role
    self.role = Role.default
  end

  # forward can? from role
  def can?(*args)
    self.role.can?(*args)
  end

end
