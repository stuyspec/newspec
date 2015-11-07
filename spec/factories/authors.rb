FactoryGirl.define do
  factory :author do

    sequence :first do |n|
      "John-#{n}"
    end
    last  "Doe"

    after(:build) do |author|
      author.slug = author.name.parameterize if author.slug.blank?
    end

  end
end
