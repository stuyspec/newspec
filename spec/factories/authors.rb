FactoryGirl.define do
  factory :author do

    first "John"
    last  "Doe"

    after(:build) do |author|
      author.slug = Author.slug(author)
    end

  end
end
