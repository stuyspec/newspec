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

FactoryGirl.define do
  factory :user, aliases: [:jake, :editor] do
    username 'jake.waksbaum'
    association :profile, strategy: :build
    association :role, strategy: :build
    association :department, strategy: :build
  end

  factory :miki, class: User do
    username 'miki.steele'
  end

end
