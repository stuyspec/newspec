# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
    belongs_to :profile
    belongs_to :role, -> {includes(:caps)}
    validates :username, presence: true, uniqueness: true
    after_create :add_def_profile, unless: :has_profile?
    after_create :add_def_role, unless: :has_role?


    # username alternative
    def name
      self.username
    end

    def name=(name)
      self.username = name
    end

    # make sure he gets a profile
    def add_def_profile
      self.profile = self.create_profile
    end

    def has_profile?
      not self.profile.nil?
    end

    # make sure he gets a role
    def add_def_role
      self.role = Role.default
    end

    def has_role?
      not self.role.nil?
    end

    # forward can? from role
    def can?(*args)
      self.role.can?(*args)
    end

end
