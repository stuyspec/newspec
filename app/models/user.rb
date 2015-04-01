# == Schema Information # # Table name: users
#
#  id            :integer          not null, primary key
#  username      :string(255)
#  created_at    :datetime #  updated_at    :datetime
#  profile_id    :integer #  role_id       :integer
#  department_id :integer
#

class User < ActiveRecord::Base
  ## Devise
  devise :database_authenticatable,
         :rememberable, :trackable, :omniauthable, :timeoutable,:authentication_keys => [:username]

  ## Associations
  belongs_to :profile
  belongs_to :role
  belongs_to :department
  delegate :articles, to: :profile

  ## Validations
  validates :username, presence: true, uniqueness: { case_sensitive: false}, length: { within: 3..20 }
  validates :password, presence: true, length: { within: 7..20 }

  ## Lifecycle Callbacks
  after_initialize :setup, if: :new_record?

  def to_s
    if profile.present? and profile.first.chomp(' ').size > 0
      profile.first
    else
      username
    end
  end

  def can? *args
    role.can? *args
  end

  private

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
