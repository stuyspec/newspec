FactoryGirl.define do
  factory :profile, aliases: [:author] do
    first "jake"
    last "waksbaum"
    email "jake.waksbaum@gmail.com"
  end

  factory :blank_profile, class: Profile do
  end

end
