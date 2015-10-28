FactoryGirl.define do
  factory :author do

    first "John"
    last  "Doe"

    after(:build) do |author|
      author.slug = UniqueAuthorSlug.call(author) if author.slug.blank?
    end

  end
end
