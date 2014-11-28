class User < ActiveRecord::Base
    has_one :profile
    validates :username, presence: true, uniqueness: true
    after_create :add_profile, unless: :has_profile?

    def add_profile
        self.profile = self.create_profile
    end

    def has_profile?
        not self.profile.nil?
    end
end
