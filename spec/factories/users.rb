FactoryGirl.define do
  factory :user, aliases:[:jake] do
    username 'jake.waksbaum'
    association :profile, strategy: :build
    association :role, strategy: :build
    department
  end

  factory :miki, class: User do
    username 'miki.steele'
  end

end
