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
