# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  first      :string(255)
#  last       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :profile, aliases: [:author] do
    first "jake"
    last "waksbaum"
    email "jake.waksbaum@gmail.com"
  end

  factory :blank_profile, class: Profile do
  end

end
