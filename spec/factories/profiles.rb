FactoryGirl.define do
  factory :profile, aliases: [:web] do
    first "jake"
    last "waksbaum"
    email "jake.waksbaum@gmail.com"
  end

  factory :blank_profile, class: Profile do
  end

end
