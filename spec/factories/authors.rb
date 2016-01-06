FactoryGirl.define do
  factory :author do

    sequence :first do |n|
      "John-#{n}"
    end
    last  "Doe"

    slug { name.parameterize }

    trait :unique_slug do
      after(:build) do |author|
        author.slug = Author.slug_for(author)
      end
    end

  end
end
